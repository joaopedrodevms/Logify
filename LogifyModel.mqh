//+------------------------------------------------------------------+
//|                                                  LogifyModel.mqh |
//|                                                     joaopedrodev |
//|                       https://www.mql5.com/en/users/joaopedrodev |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include "LogifyLevel.mqh"
#include "Error/Error.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct MqlLogifyModel
  {
   string formated;        // The log message formatted according to the specified format.
   string levelname;       // Textual name of the log level (e.g., "DEBUG", "INFO")
   string msg;             // Main content of the log message
   string args;            // Additional arguments associated with the log message
   ulong timestamp;        // Timestamp of the log event, represented in seconds since the start of the Unix epoch
   datetime date_time;     // Date and time of the log event, in datetime format
   ENUM_LOG_LEVEL level;   // Enumeration representing the severity level of the log
   string origin;          // Source or context of the log message (e.g., class or module)
   string filename;        // Name of the source file where the log message was generated
   string function;        // Name of the function where the log was called
   ulong line;             // Line number in the source file where the log was generated
   MqlError error;         // Error data
   
   
   void MqlLogifyModel::Reset(void)
     {
      formated = "";
      levelname = "";
      msg = "";
      args = "";
      timestamp = 0;
      date_time = 0;
      level = LOG_LEVEL_DEBUG;
      origin = "";
      filename = "";
      function = "";
      line = 0;
     }
   
   MqlLogifyModel::MqlLogifyModel(void)
     {
      this.Reset();
     }
   MqlLogifyModel::MqlLogifyModel(string _formated,string _levelname,string _msg,string _args,ulong _timestamp,datetime _date_time,ENUM_LOG_LEVEL _level,string _origin,string _filename,string _function,ulong _line,MqlError &_error)
     {
      formated = _formated;
      levelname = _levelname;
      msg = _msg;
      args = _args;
      timestamp = _timestamp;
      date_time = _date_time;
      level = _level;
      origin = _origin;
      filename = _filename;
      function = _function;
      line = _line;
      error = _error;
     }
  };
//+------------------------------------------------------------------+
