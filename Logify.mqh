//+------------------------------------------------------------------+
//|                                                       Logify.mqh |
//|                                                     joaopedrodev |
//|                       https://www.mql5.com/en/users/joaopedrodev |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include "LogifyModel.mqh"
#include "Handlers/LogifyHandler.mqh"
#include "Handlers/LogifyHandlerConsole.mqh"
#include "Handlers/LogifyHandlerDatabase.mqh"
#include "Handlers/LogifyHandlerFile.mqh"
//+------------------------------------------------------------------+
//| class : CLogify                                                  |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : Logify                                             |
//| Heritage    : No heritage                                        |
//| Description : Core class for log management.                     |
//|                                                                  |
//+------------------------------------------------------------------+
class CLogify
  {
private:
   
   CLogifyHandler    *m_handlers[];
   
public:
                     CLogify();
                    ~CLogify();
   
   //--- Handler
   void              AddHandler(CLogifyHandler *handler);
   bool              HasHandler(string name);
   CLogifyHandler    *GetHandler(string name);
   CLogifyHandler    *GetHandler(int index);
   int               SizeHandlers(void);
   
   //--- Generic method for adding logs
   bool              Append(ENUM_LOG_LEVEL level,string msg, string origin = "", string args = "",string filename="",string function="",int line=0);
   
   //--- Specific methods for each log level
   bool              Debug(string msg, string origin = "", string args = "",string filename="",string function="",int line=0);
   bool              Info(string msg, string origin = "", string args = "",string filename="",string function="",int line=0);
   bool              Alert(string msg, string origin = "", string args = "",string filename="",string function="",int line=0);
   bool              Error(string msg, string origin = "", string args = "",string filename="",string function="",int line=0);
   bool              Fatal(string msg, string origin = "", string args = "",string filename="",string function="",int line=0);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CLogify::CLogify()
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CLogify::~CLogify()
  {
   //--- Delete handlers
   int size_handlers = ArraySize(m_handlers);
   for(int i=0;i<size_handlers;i++)
     {
      delete m_handlers[i];
     }
  }
//+------------------------------------------------------------------+
//| Add handler to handlers array                                    |
//+------------------------------------------------------------------+
void CLogify::AddHandler(CLogifyHandler *handler)
  {
   int size = ArraySize(m_handlers);
   ArrayResize(m_handlers,size+1);
   m_handlers[size] = GetPointer(handler);
  }
//+------------------------------------------------------------------+
//| Checks if handler is already in the array by name                |
//+------------------------------------------------------------------+
bool CLogify::HasHandler(string name)
  {
   int size = ArraySize(m_handlers);
   for(int i=0;i<size;i++)
     {
      if(m_handlers[i].GetName() == name)
        {
         return(true);
        }
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| Get handler by name                                              |
//+------------------------------------------------------------------+
CLogifyHandler *CLogify::GetHandler(string name)
  {
   int size = ArraySize(m_handlers);
   for(int i=0;i<size;i++)
     {
      if(m_handlers[i].GetName() == name)
        {
         return(m_handlers[i]);
        }
     }
   return(NULL);
  }
//+------------------------------------------------------------------+
//| Get handler by index                                             |
//+------------------------------------------------------------------+
CLogifyHandler *CLogify::GetHandler(int index)
  {
   return(m_handlers[index]);
  }
//+------------------------------------------------------------------+
//| Gets the total size of the handlers array                        |
//+------------------------------------------------------------------+
int CLogify::SizeHandlers(void)
  {
   return(ArraySize(m_handlers));
  }
//+------------------------------------------------------------------+
//| Generic method for adding logs                                   |
//+------------------------------------------------------------------+
bool CLogify::Append(ENUM_LOG_LEVEL level,string msg, string origin = "", string args = "",string filename="",string function="",int line=0)
  {
   //--- Textual name of the log level
   string levelStr = "";
   switch(level)
     {
      case LOG_LEVEL_DEBUG: levelStr = "DEBUG"; break;
      case LOG_LEVEL_INFO : levelStr = "INFO"; break;
      case LOG_LEVEL_ALERT: levelStr = "ALERT"; break;
      case LOG_LEVEL_ERROR: levelStr = "ERROR"; break;
      case LOG_LEVEL_FATAL: levelStr = "FATAL"; break;
     }
   
   //--- Creating a log template with detailed information
   datetime time_current = TimeCurrent();
   MqlLogifyModel data("",levelStr,msg,args,time_current,time_current,level,origin,filename,function,line);
   
   //--- Call handlers
   int size = this.SizeHandlers();
   for(int i=0;i<size;i++)
     {
      data.formated = m_handlers[i].GetFormatter().FormatLog(data);
      m_handlers[i].Emit(data);
     }
   
   return(true);
  }
//+------------------------------------------------------------------+
//| Debug level message                                              |
//+------------------------------------------------------------------+
bool CLogify::Debug(string msg, string origin = "", string args = "",string filename="",string function="",int line=0)
  {
   return(this.Append(LOG_LEVEL_DEBUG,msg,origin,args,filename,function,line));
  }
//+------------------------------------------------------------------+
//| Infor level message                                              |
//+------------------------------------------------------------------+
bool CLogify::Info(string msg, string origin = "", string args = "",string filename="",string function="",int line=0)
  {
   return(this.Append(LOG_LEVEL_INFO,msg,origin,args,filename,function,line));
  }
//+------------------------------------------------------------------+
//| Alert level message                                              |
//+------------------------------------------------------------------+
bool CLogify::Alert(string msg, string origin = "", string args = "",string filename="",string function="",int line=0)
  {
   return(this.Append(LOG_LEVEL_ALERT,msg,origin,args,filename,function,line));
  }
//+------------------------------------------------------------------+
//| Error level message                                              |
//+------------------------------------------------------------------+
bool CLogify::Error(string msg, string origin = "", string args = "",string filename="",string function="",int line=0)
  {
   return(this.Append(LOG_LEVEL_ERROR,msg,origin,args,filename,function,line));
  }
//+------------------------------------------------------------------+
//| Fatal level message                                              |
//+------------------------------------------------------------------+
bool CLogify::Fatal(string msg, string origin = "", string args = "",string filename="",string function="",int line=0)
  {
   return(this.Append(LOG_LEVEL_FATAL,msg,origin,args,filename,function,line));
  }
//+------------------------------------------------------------------+
