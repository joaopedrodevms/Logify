//+------------------------------------------------------------------+
//|                                              LogifyFormatter.mqh |
//|                                                     joaopedrodev |
//|                       https://www.mql5.com/en/users/joaopedrodev |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
//+------------------------------------------------------------------+
//| Include files                                                    |
//+------------------------------------------------------------------+
#include "../LogifyModel.mqh"
//+------------------------------------------------------------------+
//| class : CLogifyFormatter                                         |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : CLogifyFormatter                                   |
//| Heritage    : No heritage                                        |
//| Description : Class responsible for formatting the log into a    |
//| string, replacing placeholders with their respective values.     |
//|                                                                  |
//+------------------------------------------------------------------+
class CLogifyFormatter
  {
private:
   
   //--- Stores the formats
   string            m_date_format;
   string            m_format[5];
   
   //--- Validate format
   bool              CheckLogFormat(string format);
   string            FormatDate(datetime date);
   
public:
                     CLogifyFormatter(string format);
                     CLogifyFormatter(string format, string date_format);
                     CLogifyFormatter(void);
                    ~CLogifyFormatter(void);
   
   void              SetDateFormat(string date_format);
   void              SetFormat(string format);
   void              SetFormat(ENUM_LOG_LEVEL level, string format);
   
   //--- Format query methods
   string            GetDateFormat(void);
   string            GetFormat(ENUM_LOG_LEVEL level=LOG_LEVEL_DEBUG);
   
   //--- Date and log formatting methods
   virtual string    Format(MqlLogifyModel &data);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CLogifyFormatter::CLogifyFormatter(string format)
  {
   this.SetDateFormat("yyyy.MM.dd hh:mm:ss");
   this.SetFormat(format);
   this.SetFormat(LOG_LEVEL_ERROR,"{date_time} [{levelname}] {msg} ({err_constant} {err_code}: {err_description})");
   this.SetFormat(LOG_LEVEL_FATAL,"{date_time} [{levelname}] {msg} ({err_constant} {err_code}: {err_description})");
  }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CLogifyFormatter::CLogifyFormatter(string format, string date_format)
  {
   this.SetDateFormat(date_format);
   this.SetFormat(format);
   this.SetFormat(LOG_LEVEL_ERROR,"{date_time} [{levelname}] {msg} ({err_constant} {err_code}: {err_description})");
   this.SetFormat(LOG_LEVEL_FATAL,"{date_time} [{levelname}] {msg} ({err_constant} {err_code}: {err_description})");
  }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CLogifyFormatter::CLogifyFormatter(void)
  {
   this.SetDateFormat("yyyy.MM.dd hh:mm:ss");
   this.SetFormat("{date_time} [{levelname}]: {msg}");
   this.SetFormat(LOG_LEVEL_ERROR,"{date_time} [{levelname}] {msg} ({err_constant} {err_code}: {err_description})");
   this.SetFormat(LOG_LEVEL_FATAL,"{date_time} [{levelname}] {msg} ({err_constant} {err_code}: {err_description})");
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CLogifyFormatter::~CLogifyFormatter(void)
  {
  }
//+------------------------------------------------------------------+
//| Sets the date and time format                                    |
//+------------------------------------------------------------------+
void CLogifyFormatter::SetDateFormat(string date_format)
  {
   m_date_format = date_format;
  }
//+------------------------------------------------------------------+
//| Sets the format for all levels                                   |
//+------------------------------------------------------------------+
void CLogifyFormatter::SetFormat(string format)
  {
   m_format[LOG_LEVEL_DEBUG] = format;
   m_format[LOG_LEVEL_INFO] = format;
   m_format[LOG_LEVEL_ALERT] = format;
   m_format[LOG_LEVEL_ERROR] = format;
   m_format[LOG_LEVEL_FATAL] = format;
  }
//+------------------------------------------------------------------+
//| Sets the format to a specific level                              |
//+------------------------------------------------------------------+
void CLogifyFormatter::SetFormat(ENUM_LOG_LEVEL level, string format)
  {
   m_format[level] = format;
  }
//+------------------------------------------------------------------+
//| Get date format                                                  |
//+------------------------------------------------------------------+
string CLogifyFormatter::GetDateFormat(void)
  {
   return(m_date_format);
  }
//+------------------------------------------------------------------+
//| Get the log format                                               |
//+------------------------------------------------------------------+
string CLogifyFormatter::GetFormat(ENUM_LOG_LEVEL level=0)
  {
   if(level >= 0 && level < 5)
     {
      return(m_format[level]);
     }
   return("Invalid level");
  }
//+------------------------------------------------------------------+
//| Validate format                                                  |
//+------------------------------------------------------------------+
bool CLogifyFormatter::CheckLogFormat(string format)
  {
   //--- Variables to track the most recent '{' opening index and the number of '{' brace openings
   int openIndex = -1;              // Index of last '{' found
   int openBraces = 0;              // '{' counter
   int len = StringLen(format);     // String length
   
   //--- Checks if string is empty
   if(len == 0)
     {
      //--- Prints error message and returns false
      Print("Formatting error: Unexpected string found. Check the placeholder pattern used.");
      return(false);
     }
   
   //--- Iterate through each character of the string
   for(int i=0;i<len;i++)
     {
      //--- Gets the current character
      ushort character = StringGetCharacter(format,i);
      
      //--- Checks if the character is an opening '{'
      if(character == '{')
        {
         openBraces++;     // Increments the opening counter '{'
         openIndex = i;    // Updates the index of the last opening
        }
      //--- Checks if the character is a closing '}'
      else if(character == '}')
        {
         //--- If there is no matching '{'
         if(openBraces == 0)
           {
            //--- Prints error message and returns false
            Print("Erro de formatação: o caractere '}' na posição ",i," não possui um '{' correspondente.");
            return(false);
           }
         
         //--- Decreases the open count because a matching '{' was found
         openBraces--;
         
         //--- Extracts the contents of the placeholder (between '{' and '}')
         string placeHolder = StringSubstr(format, openIndex + 1, i - openIndex - 1);
         
         //--- Checks if placeholder is empty
         if(StringLen(placeHolder) == 0)
           {
            //--- Prints error message and returns false
            Print("Erro de formatação: placeholder vazio detectado na posição ",i,". Um nome é esperado dentro de '{...}'.");
            return(false);
           }
        }
     }
   
   //--- After traversing the entire string, check if there are still any unmatched '{'}'
   if(openBraces > 0)
     {
      //--- Prints error message indicating the index of the last opened '{' and returns false
      Print("Erro de formatação: o placeholder '{' na posição ",openIndex," não possui um '}' correspondente.");
      return(false);
     }
   
   //--- Format is correct
   return(true);
  }
//+------------------------------------------------------------------+
//| Formats dates                                                    |
//+------------------------------------------------------------------+
string CLogifyFormatter::FormatDate(datetime date)
  {
   string formated = m_date_format;
   
   //--- Date and time structure
   MqlDateTime time;
   TimeToStruct(date, time);
   
   //--- Array with months and days of the week in string
   string months_abbr[12] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                             "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
   string months_full[12] = {"January", "February", "March", "April", "May", "June", 
                             "July", "August", "September", "October", "November", "December"};
   string day_of_week_abbr[7] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
   string day_of_week_full[7] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
   
   //--- Replace year
   StringReplace(formated, "yyyy", IntegerToString(time.year));
   StringReplace(formated, "yy", IntegerToString(time.year % 100, 2, '0'));
   
   //--- Replace month
   if(StringFind(formated,"MMM") < 0 && StringFind(formated,"MMMM") < 0)
     {
      StringReplace(formated, "MM", IntegerToString(time.mon, 2, '0'));
      StringReplace(formated, "M", IntegerToString(time.mon));
     }
   
   //--- Replace day
   StringReplace(formated, "dd", IntegerToString(time.day, 2, '0'));
   StringReplace(formated, "d", IntegerToString(time.day));
   
   //--- Replace day of year
   StringReplace(formated, "DDD", IntegerToString(time.day_of_year, 3, '0'));
   StringReplace(formated, "D", IntegerToString(time.day_of_year));
   
   //--- Replace Replace hours (24h and 12h)
   StringReplace(formated, "HH", IntegerToString(time.hour, 2, '0'));
   StringReplace(formated, "H", IntegerToString(time.hour));
   
   int hour_12 = time.hour % 12;
   if (hour_12 == 0) hour_12 = 12;
   StringReplace(formated, "hh", IntegerToString(hour_12, 2, '0'));
   StringReplace(formated, "h", IntegerToString(hour_12));
   
   //--- Replace minutes and seconds
   StringReplace(formated, "mm", IntegerToString(time.min, 2, '0'));
   StringReplace(formated, "m", IntegerToString(time.min));
   StringReplace(formated, "ss", IntegerToString(time.sec, 2, '0'));
   StringReplace(formated, "s", IntegerToString(time.sec));
   
   //--- Replace AM/PM
   bool is_am = (time.hour < 12);
   StringReplace(formated, "tt", is_am? "am" : "pm");
   StringReplace(formated, "TT", is_am? "AM" : "PM");
   
   //--- Replace month
   StringReplace(formated, "MMMM", months_full[time.mon - 1]);
   StringReplace(formated, "MMM", months_abbr[time.mon - 1]);
   
   //--- Replace day of week
   StringReplace(formated, "EEEE", day_of_week_full[time.day_of_week]);
   StringReplace(formated, "E", day_of_week_abbr[time.day_of_week]);

   return(formated);
  }
//+------------------------------------------------------------------+
//| Format logs                                                      |
//+------------------------------------------------------------------+
string CLogifyFormatter::Format(MqlLogifyModel &data)
  {
   string formated = m_format[data.level];
   
   StringReplace(formated,"{levelname}",data.levelname);
   StringReplace(formated,"{msg}",data.msg);
   StringReplace(formated,"{args}",data.args);
   StringReplace(formated,"{timestamp}",IntegerToString(data.timestamp));
   StringReplace(formated,"{date_time}",this.FormatDate(data.date_time));
   StringReplace(formated,"{level}",IntegerToString(data.level));
   StringReplace(formated,"{origin}",data.origin);
   StringReplace(formated,"{filename}",data.filename);
   StringReplace(formated,"{function}",data.function);
   StringReplace(formated,"{line}",IntegerToString(data.line));
   
   if(data.level >= LOG_LEVEL_ERROR)
     {
      StringReplace(formated,"{err_code}",IntegerToString(data.error.code));
      StringReplace(formated,"{err_constant}",data.error.constant);
      StringReplace(formated,"{err_description}",data.error.description);
     }
   else
     {
      StringReplace(formated,"{err_code}","");
      StringReplace(formated,"{err_constant}","");
      StringReplace(formated,"{err_description}","");
     }
   
   return(formated);
  }
//+------------------------------------------------------------------+
