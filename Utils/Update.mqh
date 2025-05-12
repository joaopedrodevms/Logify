//+------------------------------------------------------------------+
//|                                                       Update.mqh |
//|                                                     joaopedrodev |
//|                       https://www.mql5.com/en/users/joaopedrodev |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
//+------------------------------------------------------------------+
//| class : CUpdate                                                  |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CUpdate                                            |
//| Type        : Report                                             |
//| Heritage    : No heredirary.                                     |
//| Description : Class report new data(ex: bar,day,week,month).     |
//|                                                                  |
//+------------------------------------------------------------------+
class CUpdate
  {
private:
   
   ulong             m_last_time;
   
   ulong             m_interval;
   bool              m_first_return;
   
public:
   
                     CUpdate(ENUM_TIMEFRAMES interval, bool first_return = true);
                     CUpdate(ulong interval, bool first_return = true);
                     CUpdate(void);
                    ~CUpdate(void);
   //--- Setters
   void              SetInterval(ENUM_TIMEFRAMES interval);
   void              SetInterval(ulong interval);
   void              SetFirstReturn(bool first_return);
   //--- Getters
   ulong             GetInterval(void);
   bool              GetFirstReturn(void);
   ulong             GetLastTime(void);
   //--- Data
   bool              Inspect(void);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CUpdate::CUpdate(ENUM_TIMEFRAMES interval, bool first_return = true)
  {
   m_interval = PeriodSeconds(interval);
   m_first_return = first_return;
   m_last_time = 0;
  }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CUpdate::CUpdate(ulong interval, bool first_return = true)
  {
   m_interval = interval;
   m_first_return = first_return;
   m_last_time = 0;
  }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CUpdate::CUpdate(void)
  {
   m_interval = 10; // 10 seconds
   m_first_return = true;
   m_last_time = 0;
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CUpdate::~CUpdate(void)
  {
  }
//+------------------------------------------------------------------+
//| Set interval                                                     |
//+------------------------------------------------------------------+
void CUpdate::SetInterval(ENUM_TIMEFRAMES interval)
  {
   m_interval     = PeriodSeconds(interval);
  }
//+------------------------------------------------------------------+
//| Set interval                                                     |
//+------------------------------------------------------------------+
void CUpdate::SetInterval(ulong interval)
  {
   m_interval     = interval;
  }
//+------------------------------------------------------------------+
//| Set initial return                                               |
//+------------------------------------------------------------------+
void CUpdate::SetFirstReturn(bool first_return)
  {
   m_first_return=first_return;
  }
//+------------------------------------------------------------------+
//| Get interval                                                     |
//+------------------------------------------------------------------+
ulong CUpdate::GetInterval(void)
  {
   return(m_interval);
  }
//+------------------------------------------------------------------+
//| Set initial return                                               |
//+------------------------------------------------------------------+
bool CUpdate::GetFirstReturn(void)
  {
   return(m_first_return);
  }
//+------------------------------------------------------------------+
//| Set last time                                                    |
//+------------------------------------------------------------------+
ulong CUpdate::GetLastTime(void)
  {
   return(m_last_time);
  }
//+------------------------------------------------------------------+
//| Check if there was an update                                     |
//+------------------------------------------------------------------+
bool CUpdate::Inspect(void)
  {
   ulong time_current = (ulong)TimeCurrent();
   //---
   if(m_last_time == 0)
     {
      m_last_time = time_current;
      return(m_first_return);
     }
   //---
   if(time_current >= m_last_time + m_interval)
     {
      m_last_time = time_current;
      return(true);
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+
