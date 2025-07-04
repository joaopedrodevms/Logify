//+------------------------------------------------------------------+
//|                                         LogifyHandlerConsole.mqh |
//|                                                     joaopedrodev |
//|                       https://www.mql5.com/en/users/joaopedrodev |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
//+------------------------------------------------------------------+
//| Include files                                                    |
//+------------------------------------------------------------------+
#include "LogifyHandler.mqh"
//+------------------------------------------------------------------+
//| class : CLogifyHandlerConsole                                    |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CLogifyHandlerConsole                              |
//| Heritage    : CLogifyHandler                                     |
//| Description : Log handler, inserts data into terminal window.    |
//|                                                                  |
//+------------------------------------------------------------------+
class CLogifyHandlerConsole : public CLogifyHandler
  {
public:
                     CLogifyHandlerConsole(void);
                    ~CLogifyHandlerConsole(void);
   
   virtual void      Emit(MqlLogifyModel &data);         // Processes a log message and sends it to the specified destination
   virtual void      Flush(void);                        // Clears or completes any pending operations
   virtual void      Close(void);                        // Closes the handler and releases any resources
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CLogifyHandlerConsole::CLogifyHandlerConsole(void)
  {
   m_name = "console";
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CLogifyHandlerConsole::~CLogifyHandlerConsole(void)
  {
  }
//+------------------------------------------------------------------+
//| Processes a log message and sends it to the specified destination|
//+------------------------------------------------------------------+
void CLogifyHandlerConsole::Emit(MqlLogifyModel &data)
  {
   if(data.level >= this.GetLevel())
     {
      Print(data.formated);
     }
  }
//+------------------------------------------------------------------+
//| Clears or completes any pending operations                       |
//+------------------------------------------------------------------+
void CLogifyHandlerConsole::Flush(void)
  {
  }
//+------------------------------------------------------------------+
//| Closes the handler and releases any resources                    |
//+------------------------------------------------------------------+
void CLogifyHandlerConsole::Close(void)
  {
  }
//+------------------------------------------------------------------+
