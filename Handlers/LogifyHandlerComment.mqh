//+------------------------------------------------------------------+
//|                                         LogifyHandlerComment.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
//+------------------------------------------------------------------+
//| Include files                                                    |
//+------------------------------------------------------------------+
#include "LogifyHandler.mqh"
//+------------------------------------------------------------------+
//| ENUMS                                                            |
//+------------------------------------------------------------------+
enum ENUM_LOG_FRAME_STYLE
  {
   LOG_FRAME_STYLE_NONE = 0,           // No rotation
   LOG_FRAME_STYLE_SINGLE,             // Rotate based on date
   LOG_FRAME_STYLE_DOUBLE,             // Rotate based on file size
  };
enum ENUM_LOG_DIRECTION
  {
   LOG_DIRECTION_UP = 0,               // Up
   LOG_DIRECTION_DOWN,                 // Down
  };
//+------------------------------------------------------------------+
//| Struct: MqlLogifyHandleComment                                   |
//+------------------------------------------------------------------+
struct MqlLogifyHandleCommentConfig
  {
   int size;                           // Space in lines that it will occupy
   ENUM_LOG_FRAME_STYLE frame_style;   // Display grid
   ENUM_LOG_DIRECTION direction;       // Direction
   string title;                       // log title
   
   //--- Default constructor
   MqlLogifyHandleCommentConfig(void)
     {
      size = 20;
      frame_style = LOG_FRAME_STYLE_SINGLE;
      direction = LOG_DIRECTION_UP;
      title = "LOGIFY";
     }
   
   //--- Destructor
   ~MqlLogifyHandleCommentConfig(void)
     {
     }

   //--- Validate configuration
   bool ValidateConfig(string &error_message)
     {
      //--- Saves the return value
      bool is_valid = true;
      
      //--- Check if size is greater than 0
      if(size <= 0)
        {
         size = 20;
         error_message = "Size must be greater than 0.";
         is_valid = false;
        }
      
      //--- Check len
      if(StringLen(title) > 40)
        {
         error_message = "Title is too long for frame. Max 40 chars.";
         is_valid = false;
        }
      
      //--- No errors found
      return(is_valid);
     }
  };
//+------------------------------------------------------------------+
//| class : CLogifyHandlerComment                                    |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CLogifyHandlerComment                              |
//| Heritage    : CLogifyHandler                                     |
//| Description : Log handler, inserts data into chart comment.      |
//|                                                                  |
//+------------------------------------------------------------------+
class CLogifyHandlerComment : public CLogifyHandler
  {
private:
   MqlLogifyHandleCommentConfig m_config;
   MqlLogifyModel    m_logs[];
   
   //--- Aux
   string            GetBorderTop();
   string            GetBorderMiddle();
   string            GetBorderBottom();
   string            GetSideBorder();
   string            BuildHeader();
   string            BuildFooter();
   string            FormatLogLines();
   
public:
                     CLogifyHandlerComment(void);
                    ~CLogifyHandlerComment(void);
   
   //--- Configuration management
   void              SetConfig(MqlLogifyHandleCommentConfig &config);
   MqlLogifyHandleCommentConfig GetConfig(void);
   
   virtual void      Emit(MqlLogifyModel &data);         // Processes a log message and sends it to the specified destination
   virtual void      Flush(void);                        // Clears or completes any pending operations
   virtual void      Close(void);                        // Closes the handler and releases any resources
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CLogifyHandlerComment::CLogifyHandlerComment(void)
  {
   m_name = "comment";
   ArrayResize(m_logs, m_config.size);
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CLogifyHandlerComment::~CLogifyHandlerComment(void)
  {
  }
//+------------------------------------------------------------------+
//| Set configuration                                                |
//+------------------------------------------------------------------+
void CLogifyHandlerComment::SetConfig(MqlLogifyHandleCommentConfig &config)
  {
   m_config = config;
   
   //--- Validade config
   string err_msg = "";
   if(!m_config.ValidateConfig(err_msg))
     {
      Print("[ERROR] ["+TimeToString(TimeCurrent())+"] Log system error: "+err_msg);
     }
   
   //--- Resize
   ArrayResize(m_logs, m_config.size);
  }
//+------------------------------------------------------------------+
//| Get configuration                                                |
//+------------------------------------------------------------------+
MqlLogifyHandleCommentConfig CLogifyHandlerComment::GetConfig(void)
  {
   return(m_config);
  }
//+------------------------------------------------------------------+
//| Processes a log message and sends it to the specified destination|
//+------------------------------------------------------------------+
void CLogifyHandlerComment::Emit(MqlLogifyModel &data)
  {
   //--- Check if log level is allowed
   if(data.level < this.GetLevel())
     {
      return;
     }

   //--- Shift logs to maintain history
   for(int i = m_config.size-1; i > 0; i--)
     {
      m_logs[i] = m_logs[i-1];
     }
   m_logs[0] = data;

   //--- Build the complete comment
   string comment = BuildHeader();
   comment += FormatLogLines();
   comment += BuildFooter();

   //--- Display on chart
   Comment(comment);
  }
//+------------------------------------------------------------------+
//| Clears or completes any pending operations                       |
//+------------------------------------------------------------------+
void CLogifyHandlerComment::Flush(void)
  {
  }
//+------------------------------------------------------------------+
//| Closes the handler and releases any resources                    |
//+------------------------------------------------------------------+
void CLogifyHandlerComment::Close(void)
  {
   //--- Clear
   Comment("");
  }
//+------------------------------------------------------------------+
//| Returns the side border character based on frame style          |
//+------------------------------------------------------------------+
string CLogifyHandlerComment::GetSideBorder()
  {
   if(m_config.frame_style == LOG_FRAME_STYLE_SINGLE) return "│";
   if(m_config.frame_style == LOG_FRAME_STYLE_DOUBLE) return "║";
   return "";
  }
//+------------------------------------------------------------------+
//| Returns the top border based on frame style                     |
//+------------------------------------------------------------------+
string CLogifyHandlerComment::GetBorderTop()
  {
   if(m_config.frame_style == LOG_FRAME_STYLE_SINGLE)
      return "┌───────────────────────────────────────────┐\n";
   if(m_config.frame_style == LOG_FRAME_STYLE_DOUBLE)
      return "╔═══════════════════════════════════════════╗\n";
   return "";
  }
//+------------------------------------------------------------------+
//| Returns the middle separator based on frame style               |
//+------------------------------------------------------------------+
string CLogifyHandlerComment::GetBorderMiddle()
  {
   if(m_config.frame_style == LOG_FRAME_STYLE_SINGLE)
      return "├───────────────────────────────────────────┤\n";
   if(m_config.frame_style == LOG_FRAME_STYLE_DOUBLE)
      return "╠═══════════════════════════════════════════╣\n";
   return "";
  }
//+------------------------------------------------------------------+
//| Returns the bottom border based on frame style                  |
//+------------------------------------------------------------------+
string CLogifyHandlerComment::GetBorderBottom()
  {
   if(m_config.frame_style == LOG_FRAME_STYLE_SINGLE)
      return "└───────────────────────────────────────────┘\n";
   if(m_config.frame_style == LOG_FRAME_STYLE_DOUBLE)
      return "╚═══════════════════════════════════════════╝\n";
   return "";
  }
//+------------------------------------------------------------------+
//| Builds the comment header with optional title and frame         |
//+------------------------------------------------------------------+
string CLogifyHandlerComment::BuildHeader()
  {
   string header = "";

   if(m_config.title != "" && m_config.title != NULL)
     {
      if(m_config.frame_style == LOG_FRAME_STYLE_NONE)
        {
         header += " " + m_config.title + "\n";
         header += "─────────────────────────────────────────────\n";
        }
      else
        {
         header += GetBorderTop();
         header += GetSideBorder() + " " + m_config.title + "\n";
         header += GetBorderMiddle();
        }
     }
   else
     {
      if(m_config.frame_style != LOG_FRAME_STYLE_NONE)
        {
         header += GetBorderTop();
        }
     }

   return header;
  }
//+------------------------------------------------------------------+
//| Builds the comment footer based on frame style                  |
//+------------------------------------------------------------------+
string CLogifyHandlerComment::BuildFooter()
  {
   if(m_config.frame_style != LOG_FRAME_STYLE_NONE)
      return GetBorderBottom();
   return "";
  }
//+------------------------------------------------------------------+
//| Formats all log lines according to direction and frame          |
//+------------------------------------------------------------------+
string CLogifyHandlerComment::FormatLogLines()
  {
   string result = "";
   string side = GetSideBorder();

   if(m_config.direction == LOG_DIRECTION_UP)
     {
      for(int i = m_config.size-1; i >= 0; i--)
        {
         string line = m_logs[i].formated;
         StringReplace(line,"\n","\n"+side+" ");
         if(line != "")
           {
            result += side + " " + line + "\n";
           }
         else
           {
            result += side + "\n";
           }
        }
     }
   else // LOG_DIRECTION_DOWN
     {
      for(int i = 0; i <= m_config.size-1; i++)
        {
         string line = m_logs[i].formated;
         StringReplace(line,"\n","\n"+side+" ");
         if(line != "")
           {
            result += side + " " + line + "\n";
           }
         else
           {
            result += side + "\n";
           }
        }
     }

   return result;
  }
//+------------------------------------------------------------------+
