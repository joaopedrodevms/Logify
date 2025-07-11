//+------------------------------------------------------------------+
//|                                                  LogifyError.mqh |
//|                                                     joaopedrodev |
//|                       https://www.mql5.com/en/users/joaopedrodev |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
//+------------------------------------------------------------------+
//| Import                                                           |
//+------------------------------------------------------------------+
#include "Error.mqh"
#include "Languages/ErrorMessages.de.mqh"
#include "Languages/ErrorMessages.en.mqh"
#include "Languages/ErrorMessages.es.mqh"
#include "Languages/ErrorMessages.fr.mqh"
#include "Languages/ErrorMessages.it.mqh"
#include "Languages/ErrorMessages.ja.mqh"
#include "Languages/ErrorMessages.ko.mqh"
#include "Languages/ErrorMessages.pt.mqh"
#include "Languages/ErrorMessages.ru.mqh"
#include "Languages/ErrorMessages.tr.mqh"
#include "Languages/ErrorMessages.zh.mqh"
//+------------------------------------------------------------------+
//| All languages                                                    |
//+------------------------------------------------------------------+
enum ENUM_LANGUAGE
  {
   LANGUAGE_DE = 0,     // [0] German
   LANGUAGE_EN,         // [1] English
   LANGUAGE_ES,         // [2] Spanish
   LANGUAGE_FR,         // [3] French
   LANGUAGE_IT,         // [4] Italian
   LANGUAGE_JA,         // [5] Japanese
   LANGUAGE_KO,         // [6] Korean
   LANGUAGE_PT,         // [7] Portuguese
   LANGUAGE_RU,         // [8] Russian
   LANGUAGE_TR,         // [9] Turkish
   LANGUAGE_ZH,         // [10] Chinese
  };
//+------------------------------------------------------------------+
//| class : CLogifyError                                             |
//|                                                                  |
//| [PROPERTY]                                                       |
//| Name        : LogifyError                                        |
//| Heritage    : No heritage                                        |
//| Description : class to look up the error code and return details |
//|               of each error code.                                |
//|                                                                  |
//+------------------------------------------------------------------+
class CLogifyError
  {
private:
   
   ENUM_LANGUAGE     m_language;
   MqlError          m_errors[];
   
public:
                     CLogifyError(void);
                    ~CLogifyError(void);
   
   //--- Set/Get
   void              SetLanguage(ENUM_LANGUAGE language);
   ENUM_LANGUAGE     GetLanguage(void);
   
   //--- Get error
   MqlError          Error(int code);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CLogifyError::CLogifyError()
  {
   InitializeErrorsEnglish(m_errors);
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CLogifyError::~CLogifyError(void)
  {
  }
//+------------------------------------------------------------------+
//| Defines the language to be displayed                             |
//+------------------------------------------------------------------+
void CLogifyError::SetLanguage(ENUM_LANGUAGE language)
  {
   m_language = language;
   switch(language)
     {
      case LANGUAGE_DE:
        InitializeErrorsGerman(m_errors);
        break;
      case LANGUAGE_EN:
        InitializeErrorsEnglish(m_errors);
        break;
      case LANGUAGE_ES:
        InitializeErrorsSpanish(m_errors);
        break;
      case LANGUAGE_FR:
        InitializeErrorsFrench(m_errors);
        break;
      case LANGUAGE_IT:
        InitializeErrorsItalian(m_errors);
        break;
      case LANGUAGE_JA:
        InitializeErrorsJapanese(m_errors);
        break;
      case LANGUAGE_KO:
        InitializeErrorsKorean(m_errors);
        break;
      case LANGUAGE_PT:
        InitializeErrorsPortuguese(m_errors);
        break;
      case LANGUAGE_RU:
        InitializeErrorsRussian(m_errors);
        break;
      case LANGUAGE_TR:
        InitializeErrorsTurkish(m_errors);
        break;
      case LANGUAGE_ZH:
        InitializeErrorsChinese(m_errors);
        break;
      default:
        InitializeErrorsEnglish(m_errors);
        break;
     }
  }
//+------------------------------------------------------------------+
//| Get language                                                     |
//+------------------------------------------------------------------+
ENUM_LANGUAGE CLogifyError::GetLanguage(void)
  {
   return(m_language);
  }
//+------------------------------------------------------------------+
//| Returns error information based on the error code received       |
//+------------------------------------------------------------------+
MqlError CLogifyError::Error(int code)
  {
   int size = ArraySize(m_errors);
   for(int i=0;i<size;i++)
     {
      if(m_errors[i].code == code)
        {
         //--- Return
         return(m_errors[i]);
        }
     }
   
   //--- User error
   if(code >= ERR_USER_ERROR_FIRST && code < ERR_USER_ERROR_LAST)
     {
      MqlError error;
      error.code = code;
      error.constant = "User error";
      error.description = "ERR_USER_ERROR";
      
      //--- Return
      return(m_errors[274]);
     }
   
   //--- Return
   return(m_errors[0]);
  }
//+------------------------------------------------------------------+