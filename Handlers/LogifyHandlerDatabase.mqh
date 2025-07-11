//+------------------------------------------------------------------+
//|                                        LogifyHandlerDatabase.mqh |
//|                                                     joaopedrodev |
//|                       https://www.mql5.com/en/users/joaopedrodev |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
//+------------------------------------------------------------------+
//| Include files                                                    |
//+------------------------------------------------------------------+
#include "LogifyHandler.mqh"
#include "../Utils/IntervalWatcher.mqh"
//+------------------------------------------------------------------+
//| Struct: MqlLogifyHandleDatabaseConfig                            |
//+------------------------------------------------------------------+
struct MqlLogifyHandleDatabaseConfig
  {
   string directory;                         // Directory for log files
   string base_filename;                     // Base file name
   int messages_per_flush;                   // Messages before flushing
   
   //--- Default constructor
   MqlLogifyHandleDatabaseConfig(void)
     {
      directory = "logs";                    // Default directory
      base_filename = "expert";              // Default base name
      messages_per_flush = 100;              // Default flush threshold
     }
   
   //--- Destructor
   ~MqlLogifyHandleDatabaseConfig(void)
     {
     }

   //--- Validate configuration
   bool ValidateConfig(string &error_message)
     {
      //--- Saves the return value
      bool is_valid = true;
      
      //--- Check if the directory is not empty
      if(directory == "")
        {
         directory = "logs";
         error_message = "The directory cannot be empty.";
         is_valid = false;
        }
      
      //--- Check if the base filename is not empty
      if(base_filename == "")
        {
         base_filename = "expert";
         error_message = "The base filename cannot be empty.";
         is_valid = false;
        }
      
      //--- Check if the number of messages per flush is positive
      if(messages_per_flush <= 0)
        {
         messages_per_flush = 100;
         error_message = "The number of messages per flush must be greater than zero.";
         is_valid = false;
        }
   
      //--- No errors found
      return(is_valid);
     }
  };
//+------------------------------------------------------------------+
//| class : CLogifyHandlerDatabase                                   |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CLogifyHandlerDatabase                             |
//| Heritage    : CLogifyHandler                                     |
//| Description : Log handler, inserts data into terminal window.    |
//|                                                                  |
//+------------------------------------------------------------------+
class CLogifyHandlerDatabase : public CLogifyHandler
  {
private:
   //--- Config
   MqlLogifyHandleDatabaseConfig m_config;
   
   //--- Update utilities
   CIntervalWatcher  m_interval_watcher;
   
   //--- Cache data
   MqlLogifyModel    m_cache[];
   int               m_index_cache;
   
public:
                     CLogifyHandlerDatabase(void);
                    ~CLogifyHandlerDatabase(void);
   
   //--- Configuration management
   void              SetConfig(MqlLogifyHandleDatabaseConfig &config);
   MqlLogifyHandleDatabaseConfig GetConfig(void);
   
   //--- Query methods
   bool              Query(string query, MqlLogifyModel &data[]);
   bool              QueryByLevel(ENUM_LOG_LEVEL level, MqlLogifyModel &data[]);
   bool              QueryByDate(datetime start_time, datetime stop_time, MqlLogifyModel &data[]);
   bool              QueryByOrigin(string origin, MqlLogifyModel &data[]);
   bool              QueryByMsg(string msg, MqlLogifyModel &data[]);
   bool              QueryByArgs(string args, MqlLogifyModel &data[]);
   bool              QueryByFile(string file, MqlLogifyModel &data[]);
   bool              QueryByFunction(string function, MqlLogifyModel &data[]);
   
   virtual void      Emit(MqlLogifyModel &data);         // Processes a log message and sends it to the specified destination
   virtual void      Flush(void);                        // Clears or completes any pending operations
   virtual void      Close(void);                        // Closes the handler and releases any resources
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CLogifyHandlerDatabase::CLogifyHandlerDatabase(void)
  {
   m_name = "database";
   m_interval_watcher.SetInterval(PERIOD_D1);
   ArrayFree(m_cache);
   m_index_cache = 0;
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CLogifyHandlerDatabase::~CLogifyHandlerDatabase(void)
  {
   this.Close();
  }
//+------------------------------------------------------------------+
//| Set configuration                                                |
//+------------------------------------------------------------------+
void CLogifyHandlerDatabase::SetConfig(MqlLogifyHandleDatabaseConfig &config)
  {
   m_config = config;
   
   //--- Validade
   string err_msg = "";
   if(!m_config.ValidateConfig(err_msg))
     {
      Print("[ERROR] ["+TimeToString(TimeCurrent())+"] Log system error: "+err_msg);
     }
  }
//+------------------------------------------------------------------+
//| Get configuration                                                |
//+------------------------------------------------------------------+
MqlLogifyHandleDatabaseConfig CLogifyHandlerDatabase::GetConfig(void)
  {
   return(m_config);
  }
//+------------------------------------------------------------------+
//| Get data by sql command                                          |
//+------------------------------------------------------------------+
bool CLogifyHandlerDatabase::Query(string query, MqlLogifyModel &data[])
  {
   //--- Get the full path of the file
   string path = m_config.directory+"\\"+m_config.base_filename+".sqlite";
   
   //--- Open database
   ResetLastError();
   int handle_db = DatabaseOpen(path,DATABASE_OPEN_READWRITE);
   if(handle_db == INVALID_HANDLE)
     {
      Print("[ERROR] ["+TimeToString(TimeCurrent())+"] Log system error: Unable to open log file '"+path+"'. Ensure the directory exists and is writable. (Code: "+IntegerToString(GetLastError())+")");
      return(false);
     }
   
   //--- Prepare the SQL query
   int request = DatabasePrepare(handle_db,query);
   if(request == INVALID_HANDLE)
     {
      Print("Erro query");
      return(false);
     }
   
   //--- Clears array before inserting new data
   ArrayFree(data);
   
   //--- Reads query results line by line
   for(int i=0;DatabaseRead(request);i++)
     {
      int size = ArraySize(data);
      ArrayResize(data,size+1,size);
      
      //--- Maps database data to the MqlLogifyModel model
      DatabaseColumnText(request,1,data[size].formated);
      DatabaseColumnText(request,2,data[size].levelname);
      DatabaseColumnText(request,3,data[size].msg);
      DatabaseColumnText(request,4,data[size].args);
      long timestamp = (long)data[size].timestamp;
      DatabaseColumnLong(request,5,timestamp);
      string value;
      DatabaseColumnText(request,6,value);
      data[size].date_time = StringToTime(value);
      int level = data[size].level;
      DatabaseColumnInteger(request,7,level);
      DatabaseColumnText(request,8,data[size].origin);
      DatabaseColumnText(request,9,data[size].filename);
      DatabaseColumnText(request,10,data[size].function);
      long line = (long)data[size].line;
      DatabaseColumnLong(request,11,line);
     }
   
   //--- Ends the query and closes the database
   DatabaseFinalize(handle_db);
   DatabaseClose(handle_db);
   return(true);
  }
//+------------------------------------------------------------------+
//| Get logs filtering by level                                      |
//+------------------------------------------------------------------+
bool CLogifyHandlerDatabase::QueryByLevel(ENUM_LOG_LEVEL level, MqlLogifyModel &data[])
  {
   return(this.Query("SELECT * FROM 'logs' WHERE level="+IntegerToString(level)+";",data));
  }
//+------------------------------------------------------------------+
//| Get logs filtering by start end stop time                        |
//+------------------------------------------------------------------+
bool CLogifyHandlerDatabase::QueryByDate(datetime start_time, datetime stop_time, MqlLogifyModel &data[])
  {
   return(this.Query("SELECT * FROM 'logs' WHERE timestamp BETWEEN '"+IntegerToString((ulong)start_time)+"' AND '"+IntegerToString((ulong)stop_time)+"';",data));
  }
//+------------------------------------------------------------------+
//| Get logs filtering by origin                                     |
//+------------------------------------------------------------------+
bool CLogifyHandlerDatabase::QueryByOrigin(string origin, MqlLogifyModel &data[])
  {
   return(this.Query("SELECT * FROM 'logs' WHERE origin LIKE '%"+origin+"%';",data));
  }
//+------------------------------------------------------------------+
//| Get logs filtering by message                                    |
//+------------------------------------------------------------------+
bool CLogifyHandlerDatabase::QueryByMsg(string msg, MqlLogifyModel &data[])
  {
   return(this.Query("SELECT * FROM 'logs' WHERE msg LIKE '%"+msg+"%';",data));
  }
//+------------------------------------------------------------------+
//| Get logs filtering by args                                       |
//+------------------------------------------------------------------+
bool CLogifyHandlerDatabase::QueryByArgs(string args, MqlLogifyModel &data[])
  {
   return(this.Query("SELECT * FROM 'logs' WHERE args LIKE '%"+args+"%';",data));
  }
//+------------------------------------------------------------------+
//| Get logs filtering by file name                                  |
//+------------------------------------------------------------------+
bool CLogifyHandlerDatabase::QueryByFile(string file, MqlLogifyModel &data[])
  {
   return(this.Query("SELECT * FROM 'logs' WHERE filename LIKE '%"+file+"%';",data));
  }
//+------------------------------------------------------------------+
//| Get logs filtering by function name                              |
//+------------------------------------------------------------------+
bool CLogifyHandlerDatabase::QueryByFunction(string function, MqlLogifyModel &data[])
  {
   return(this.Query("SELECT * FROM 'logs' WHERE function LIKE '%"+function+"%';",data));
  }
//+------------------------------------------------------------------+
//| Processes a log message and sends it to the specified destination|
//+------------------------------------------------------------------+
void CLogifyHandlerDatabase::Emit(MqlLogifyModel &data)
  {
   //--- Checks if the configured level allows
   if(data.level >= this.GetLevel())
     {
      //--- Resize cache if necessary
      int size = ArraySize(m_cache);
      if(size != m_config.messages_per_flush)
        {
         ArrayResize(m_cache, m_config.messages_per_flush);
         size = m_config.messages_per_flush;
        }
      
      //--- Add log to cache
      m_cache[m_index_cache++] = data;
      
      //--- Flush if cache limit is reached or update condition is met
      if(m_index_cache >= m_config.messages_per_flush )//|| m_interval_watcher.Inspect())
        {
         //--- Save cache
         Flush();
         
         //--- Reset cache
         m_index_cache = 0;
         for(int i=0;i<size;i++)
           {
            m_cache[i].Reset();
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| Clears or completes any pending operations                       |
//+------------------------------------------------------------------+
void CLogifyHandlerDatabase::Flush(void)
  {
   //--- Get the full path of the file
   string path = m_config.directory+"\\"+m_config.base_filename+".sqlite";
   
   //--- Open database
   ResetLastError();
   int handle_db = DatabaseOpen(path,DATABASE_OPEN_CREATE|DATABASE_OPEN_READWRITE);
   if(handle_db == INVALID_HANDLE)
     {
      Print("[ERROR] ["+TimeToString(TimeCurrent())+"] Log system error: Unable to open log file '"+path+"'. Ensure the directory exists and is writable. (Code: "+IntegerToString(GetLastError())+")");
      return;
     }
   
   
   if(!DatabaseTableExists(handle_db,"logs"))
     {
      DatabaseExecute(handle_db,
         "CREATE TABLE logs ("
         "id INTEGER PRIMARY KEY AUTOINCREMENT,"
         "formated TEXT,"
         "levelname TEXT,"
         "msg TEXT,"
         "args TEXT,"
         "timestamp BIGINT,"
         "date_time DATETIME,"
         "level BIGINT,"
         "origin TEXT,"
         "filename TEXT,"
         "function TEXT,"
         "line BIGINT);");
     }
   
   //--- 
   string sql="INSERT INTO logs (formated, levelname, msg, args, timestamp, date_time, level, origin, filename, function, line) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11);"; // parâmetro de consulta
   int request = DatabasePrepare(handle_db,sql);
   if(request == INVALID_HANDLE)
     {
      Print("Erro");
     }
   
   //--- Loop through all cached messages
   int size = ArraySize(m_cache);
   for(int i=0;i<size;i++)
     {
      if(m_cache[i].timestamp > 0)
        {
         DatabaseBind(request,0,m_cache[i].formated);
         DatabaseBind(request,1,m_cache[i].levelname);
         DatabaseBind(request,2,m_cache[i].msg);
         DatabaseBind(request,3,m_cache[i].args);
         DatabaseBind(request,4,m_cache[i].timestamp);
         DatabaseBind(request,5,TimeToString(m_cache[i].date_time,TIME_DATE|TIME_MINUTES|TIME_SECONDS));
         DatabaseBind(request,6,(int)m_cache[i].level);
         DatabaseBind(request,7,m_cache[i].origin);
         DatabaseBind(request,8,m_cache[i].filename);
         DatabaseBind(request,9,m_cache[i].function);
         DatabaseBind(request,10,m_cache[i].line);
         DatabaseRead(request);
         DatabaseReset(request);
        }
     }
   
   //--- 
   DatabaseFinalize(request);
   
   //--- Close database
   DatabaseClose(handle_db);
  }
//+------------------------------------------------------------------+
//| Closes the handler and releases any resources                    |
//+------------------------------------------------------------------+
void CLogifyHandlerDatabase::Close(void)
  {
   //--- Save cache
   Flush();
  }
//+------------------------------------------------------------------+

