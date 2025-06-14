//+------------------------------------------------------------------+
//|                                             ErrorMessages.de.mqh |
//|                                                     joaopedrodev |
//|                       https://www.mql5.com/en/users/joaopedrodev |
//+------------------------------------------------------------------+
#property copyright "joaopedrodev"
#property link      "https://www.mql5.com/en/users/joaopedrodev"
//+------------------------------------------------------------------+
//| Import struct                                                    
//+------------------------------------------------------------------+
#include "../Error.mqh"
void InitializeErrorsGerman(MqlError &errors[])
  {
   //--- Free and resize
   ArrayFree(errors);
   ArrayResize(errors,274);
   
   //+------------------------------------------------------------------+
   //| Unknown error                                                    |
   //+------------------------------------------------------------------+
   errors[0].code = 0;
   errors[0].description = "Kein Fehler gefunden";
   errors[0].constant = "ERROR_UNKNOWN";
   //+------------------------------------------------------------------+
   //| Server error                                                     |
   //+------------------------------------------------------------------+
   errors[1].code = 10004;
   errors[1].description = "Neue Quote";
   errors[1].constant = "TRADE_RETCODE_REQUOTE";
   //---
   errors[2].code = 10006;
   errors[2].description = "Anfrage abgelehnt";
   errors[2].constant = "TRADE_RETCODE_REJECT";
   //---
   errors[3].code = 10007;
   errors[3].description = "Anfrage vom Händler storniert";
   errors[3].constant = "TRADE_RETCODE_CANCEL";
   //---
   errors[4].code = 10008;
   errors[4].description = "Auftrag platziert";
   errors[4].constant = "TRADE_RETCODE_PLACED";
   //---
   errors[5].code = 10009;
   errors[5].description = "Anfrage abgeschlossen";
   errors[5].constant = "TRADE_RETCODE_DONE";
   //---
   errors[6].code = 10010;
   errors[6].description = "Nur ein Teil der Anfrage wurde ausgeführt";
   errors[6].constant = "TRADE_RETCODE_DONE_PARTIAL";
   //---
   errors[7].code = 10011;
   errors[7].description = "Fehler bei der Verarbeitung der Anfrage";
   errors[7].constant = "TRADE_RETCODE_ERROR";
   //---
   errors[8].code = 10012;
   errors[8].description = "Anfrage wegen Zeitüberschreitung storniert";
   errors[8].constant = "TRADE_RETCODE_TIMEOUT";
   //---
   errors[9].code = 10013;
   errors[9].description = "Ungültige Anfrage";
   errors[9].constant = "TRADE_RETCODE_INVALID";
   //---
   errors[10].code = 10014;
   errors[10].description = "Ungültiges Volumen in der Anfrage";
   errors[10].constant = "TRADE_RETCODE_INVALID_VOLUME";
   //---
   errors[11].code = 10015;
   errors[11].description = "Ungültiger Preis in der Anfrage";
   errors[11].constant = "TRADE_RETCODE_INVALID_PRICE";
   //---
   errors[12].code = 10016;
   errors[12].description = "Ungültige Stops in der Anfrage";
   errors[12].constant = "TRADE_RETCODE_INVALID_STOPS";
   //---
   errors[13].code = 10017;
   errors[13].description = "Handel ist deaktiviert";
   errors[13].constant = "TRADE_RETCODE_TRADE_DISABLED";
   //---
   errors[14].code = 10018;
   errors[14].description = "Markt ist geschlossen";
   errors[14].constant = "TRADE_RETCODE_MARKET_CLOSED";
   //---
   errors[15].code = 10019;
   errors[15].description = "Nicht genügend Geld, um die Anfrage abzuschließen";
   errors[15].constant = "TRADE_RETCODE_NO_MONEY";
   //---
   errors[16].code = 10020;
   errors[16].description = "Preise haben sich geändert";
   errors[16].constant = "TRADE_RETCODE_PRICE_CHANGED";
   //---
   errors[17].code = 10021;
   errors[17].description = "Keine Kurse zur Verarbeitung der Anfrage";
   errors[17].constant = "TRADE_RETCODE_PRICE_OFF";
   //---
   errors[18].code = 10022;
   errors[18].description = "Ungültiges Ablaufdatum in der Anfrage";
   errors[18].constant = "TRADE_RETCODE_INVALID_EXPIRATION";
   //---
   errors[19].code = 10023;
   errors[19].description = "Auftragsstatus geändert";
   errors[19].constant = "TRADE_RETCODE_ORDER_CHANGED";
   //---
   errors[20].code = 10024;
   errors[20].description = "Zu viele Anfragen";
   errors[20].constant = "TRADE_RETCODE_TOO_MANY_REQUESTS";
   //---
   errors[21].code = 10025;
   errors[21].description = "Keine Änderungen in der Anfrage";
   errors[21].constant = "TRADE_RETCODE_NO_CHANGES";
   //---
   errors[22].code = 10026;
   errors[22].description = "Autotrading vom Server deaktiviert";
   errors[22].constant = "TRADE_RETCODE_SERVER_DISABLES_AT";
   //---
   errors[23].code = 10027;
   errors[23].description = "Autotrading vom Client-Terminal deaktiviert";
   errors[23].constant = "TRADE_RETCODE_CLIENT_DISABLES_AT";
   //---
   errors[24].code = 10028;
   errors[24].description = "Anfrage zur Verarbeitung gesperrt";
   errors[24].constant = "TRADE_RETCODE_LOCKED";
   //---
   errors[25].code = 10029;
   errors[25].description = "Auftrag oder Position eingefroren";
   errors[25].constant = "TRADE_RETCODE_FROZEN";
   //---
   errors[26].code = 10030;
   errors[26].description = "Ungültiger Auftragsausführungstyp";
   errors[26].constant = "TRADE_RETCODE_INVALID_FILL";
   //---
   errors[27].code = 10031;
   errors[27].description = "Keine Verbindung zum Handelsserver";
   errors[27].constant = "TRADE_RETCODE_CONNECTION";
   //---
   errors[28].code = 10032;
   errors[28].description = "Operation nur für Echtkonten erlaubt";
   errors[28].constant = "TRADE_RETCODE_ONLY_REAL";
   //---
   errors[29].code = 10033;
   errors[29].description = "Anzahl der ausstehenden Aufträge hat das Limit erreicht";
   errors[29].constant = "TRADE_RETCODE_LIMIT_ORDERS";
   //---
   errors[30].code = 10034;
   errors[30].description = "Handelsvolumen für das Symbol hat das Limit erreicht";
   errors[30].constant = "TRADE_RETCODE_LIMIT_VOLUME";
   //---
   errors[31].code = 10035;
   errors[31].description = "Falscher oder verbotener Auftragstyp";
   errors[31].constant = "TRADE_RETCODE_INVALID_ORDER";
   //---
   errors[32].code = 10036;
   errors[32].description = "Position mit der angegebenen POSITION_IDENTIFIER wurde bereits geschlossen";
   errors[32].constant = "TRADE_RETCODE_POSITION_CLOSED";
   //---
   errors[33].code = 10038;
   errors[33].description = "Das zu schließende Volumen übersteigt das aktuelle Positionsvolumen";
   errors[33].constant = "TRADE_RETCODE_INVALID_CLOSE_VOLUME";
   //---
   errors[34].code = 10039;
   errors[34].description = "Siehe Dokumentation";
   errors[34].constant = "TRADE_RETCODE_CLOSE_ORDER_EXIST";
   //---
   errors[35].code = 10040;
   errors[35].description = "Siehe Dokumentation";
   errors[35].constant = "TRADE_RETCODE_LIMIT_POSITIONS";
   //---
   errors[36].code = 10041;
   errors[36].description = "Die Aktivierungsanfrage für den ausstehenden Auftrag wurde abgelehnt und der Auftrag storniert";
   errors[36].constant = "TRADE_RETCODE_REJECT_CANCEL";
   //---
   errors[37].code = 10042;
   errors[37].description = "Der Auftrag wurde abgelehnt, da für das Symbol die Regel 'Nur Long-Positionen erlaubt' (POSITION_TYPE_BUY) festgelegt wurde";
   errors[37].constant = "TRADE_RETCODE_LONG_ONLY";
   //---
   errors[38].code = 10043;
   errors[38].description = "Der Auftrag wurde abgelehnt, da für das Symbol die Regel 'Nur Short-Positionen erlaubt' (POSITION_TYPE_SELL) festgelegt wurde";
   errors[38].constant = "TRADE_RETCODE_SHORT_ONLY";
   //---
   errors[39].code = 10044;
   errors[39].description = "Der Auftrag wurde abgelehnt, da für das Symbol die Regel 'Nur Positionsschließung erlaubt' festgelegt wurde";
   errors[39].constant = "TRADE_RETCODE_CLOSE_ONLY";
   //---
   errors[40].code = 10045;
   errors[40].description = "Der Auftrag wurde abgelehnt, da für das Symbol die Regel 'Nur Positionsschließung erlaubt' festgelegt wurde";
   errors[40].constant = "TRADE_RETCODE_FIFO_CLOSE";
   //---
   errors[41].code = 10046;
   errors[41].description = "Der Auftrag wurde abgelehnt, da für das Symbol die Regel 'Gegenpositionen für dasselbe Symbol verboten' festgelegt wurde";
   errors[41].constant = "TRADE_RETCODE_HEDGE_PROHIBITED";
   //+------------------------------------------------------------------+
   //| Errors sistem                                                    |
   //+------------------------------------------------------------------+
   errors[42].code = 4001;
   errors[42].description = "Unerwarteter interner Fehler";
   errors[42].constant = "ERR_INTERNAL_ERROR";
   //---
   errors[43].code = 4002;
   errors[43].description = "Falscher Parameter beim internen Aufruf der Client-Terminal-Funktion";
   errors[43].constant = "ERR_WRONG_INTERNAL_PARAMETER";
   //---
   errors[44].code = 4003;
   errors[44].description = "Falscher Parameter beim Aufruf der Systemfunktion";
   errors[44].constant = "ERR_INVALID_PARAMETER";
   //---
   errors[45].code = 4004;
   errors[45].description = "Nicht genügend Speicher zum Ausführen der Systemfunktion";
   errors[45].constant = "ERR_NOT_ENOUGH_MEMORY";
   //---
   errors[46].code = 4005;
   errors[46].description = "Die Struktur enthält String-Objekte und/oder dynamische Arrays und/oder Strukturen solcher Objekte und/oder Klassen";
   errors[46].constant = "ERR_STRUCT_WITHOBJECTS_ORCLASS";
   //---
   errors[47].code = 4006;
   errors[47].description = "Array von falschem Typ, falscher Größe oder fehlerhaftes Objekt eines dynamischen Arrays";
   errors[47].constant = "ERR_INVALID_ARRAY";
   //---
   errors[48].code = 4007;
   errors[48].description = "Nicht genügend Speicher für die Neuzuweisung eines Arrays oder Versuch, die Größe eines statischen Arrays zu ändern";
   errors[48].constant = "ERR_ARRAY_RESIZE_ERROR";
   //---
   errors[49].code = 4008;
   errors[49].description = "Nicht genügend Speicher für die Neuzuweisung der Zeichenkette";
   errors[49].constant = "ERR_STRING_RESIZE_ERROR";
   //---
   errors[50].code = 4009;
   errors[50].description = "Nicht initialisierte Zeichenkette";
   errors[50].constant = "ERR_NOTINITIALIZED_STRING";
   //---
   errors[51].code = 4010;
   errors[51].description = "Ungültiges Datum und/oder Uhrzeit";
   errors[51].constant = "ERR_INVALID_DATETIME";
   //---
   errors[52].code = 4011;
   errors[52].description = "Die Gesamtanzahl der Elemente im Array darf 2147483647 nicht überschreiten";
   errors[52].constant = "ERR_ARRAY_BAD_SIZE";
   //---
   errors[53].code = 4012;
   errors[53].description = "Falscher Zeiger";
   errors[53].constant = "ERR_INVALID_POINTER";
   //---
   errors[54].code = 4013;
   errors[54].description = "Falscher Zeigertyp";
   errors[54].constant = "ERR_INVALID_POINTER_TYPE";
   //---
   errors[55].code = 4014;
   errors[55].description = "Systemfunktion darf nicht aufgerufen werden";
   errors[55].constant = "ERR_FUNCTION_NOT_ALLOWED";
   //---
   errors[56].code = 4015;
   errors[56].description = "Namen der dynamischen und statischen Ressourcen sind identisch";
   errors[56].constant = "ERR_RESOURCE_NAME_DUPLICATED";
   //---
   errors[57].code = 4016;
   errors[57].description = "Ressource mit diesem Namen wurde in EX5 nicht gefunden";
   errors[57].constant = "ERR_RESOURCE_NOT_FOUND";
   //---
   errors[58].code = 4017;
   errors[58].description = "Nicht unterstützter Ressourcentyp oder seine Größe überschreitet 16 Mb";
   errors[58].constant = "ERR_RESOURCE_UNSUPPOTED_TYPE";
   //---
   errors[59].code = 4018;
   errors[59].description = "Der Ressourcenname überschreitet 63 Zeichen";
   errors[59].constant = "ERR_RESOURCE_NAME_IS_TOO_LONG";
   //---
   errors[60].code = 4019;
   errors[60].description = "Bei der Berechnung mathematischer Funktionen ist ein Überlauf aufgetreten";
   errors[60].constant = "ERR_MATH_OVERFLOW";
   //---
   errors[61].code = 4020;
   errors[61].description = "Testende überschritten nach Aufruf von Sleep()";
   errors[61].constant = "ERR_SLEEP_ERROR";
   //---
   errors[62].code = 4022;
   errors[62].description = "Tests wurden von außen zwangsweise unterbrochen. Zum Beispiel beim Unterbrechen der Optimierung, beim Schließen des visuellen Testfensters oder beim Stoppen des Test-Agenten";
   errors[62].constant = "ERR_STOPPED";
   //+------------------------------------------------------------------+
   //| Charts                                                           |
   //+------------------------------------------------------------------+
   errors[63].code = 4101;
   errors[63].description = "Falsche Chart-ID";
   errors[63].constant = "ERR_CHART_WRONG_ID";
   //---
   errors[64].code = 4102;
   errors[64].description = "Chart antwortet nicht";
   errors[64].constant = "ERR_CHART_NO_REPLY";
   //---
   errors[65].code = 4103;
   errors[65].description = "Chart nicht gefunden";
   errors[65].constant = "ERR_CHART_NOT_FOUND";
   //---
   errors[66].code = 4104;
   errors[66].description = "Kein Expert Advisor im Chart, der das Ereignis verarbeiten könnte";
   errors[66].constant = "ERR_CHART_NO_EXPERT";
   //---
   errors[67].code = 4105;
   errors[67].description = "Fehler beim Öffnen des Charts";
   errors[67].constant = "ERR_CHART_CANNOT_OPEN";
   //---
   errors[68].code = 4106;
   errors[68].description = "Fehler beim Ändern des Symbols und Zeitraums eines Charts";
   errors[68].constant = "ERR_CHART_CANNOT_CHANGE";
   //---
   errors[69].code = 4107;
   errors[69].description = "Falscher Parameterwert für die Funktion, die mit Charts arbeitet";
   errors[69].constant = "ERR_CHART_WRONG_PARAMETER";
   //---
   errors[70].code = 4108;
   errors[70].description = "Fehler beim Erstellen des Timers";
   errors[70].constant = "ERR_CHART_CANNOT_CREATE_TIMER";
   //---
   errors[71].code = 4109;
   errors[71].description = "Falsche Chart-Eigenschafts-ID";
   errors[71].constant = "ERR_CHART_WRONG_PROPERTY";
   //---
   errors[72].code = 4110;
   errors[72].description = "Fehler beim Erstellen von Screenshots";
   errors[72].constant = "ERR_CHART_SCREENSHOT_FAILED";
   //---
   errors[73].code = 4111;
   errors[73].description = "Fehler bei der Chart-Navigation";
   errors[73].constant = "ERR_CHART_NAVIGATE_FAILED";
   //---
   errors[74].code = 4112;
   errors[74].description = "Fehler beim Anwenden des Templates";
   errors[74].constant = "ERR_CHART_TEMPLATE_FAILED";
   //---
   errors[75].code = 4113;
   errors[75].description = "Unterfenster mit dem Indikator wurde nicht gefunden";
   errors[75].constant = "ERR_CHART_WINDOW_NOT_FOUND";
   //---
   errors[76].code = 4114;
   errors[76].description = "Fehler beim Hinzufügen eines Indikators zum Chart";
   errors[76].constant = "ERR_CHART_INDICATOR_CANNOT_ADD";
   //---
   errors[77].code = 4115;
   errors[77].description = "Fehler beim Löschen eines Indikators vom Chart";
   errors[77].constant = "ERR_CHART_INDICATOR_CANNOT_DEL";
   //---
   errors[78].code = 4116;
   errors[78].description = "Indikator im angegebenen Chart nicht gefunden";
   errors[78].constant = "ERR_CHART_INDICATOR_NOT_FOUND";
   //+------------------------------------------------------------------+
   //| Graphical Objects                                                |
   //+------------------------------------------------------------------+
   errors[79].code = 4201;
   errors[79].description = "Fehler bei der Arbeit mit einem grafischen Objekt";
   errors[79].constant = "ERR_OBJECT_ERROR";
   //---
   errors[80].code = 4202;
   errors[80].description = "Grafisches Objekt wurde nicht gefunden";
   errors[80].constant = "ERR_OBJECT_NOT_FOUND";
   //---
   errors[81].code = 4203;
   errors[81].description = "Falsche ID einer Eigenschaft des grafischen Objekts";
   errors[81].constant = "ERR_OBJECT_WRONG_PROPERTY";
   //---
   errors[82].code = 4204;
   errors[82].description = "Datum entsprechend dem Wert konnte nicht erhalten werden";
   errors[82].constant = "ERR_OBJECT_GETDATE_FAILED";
   //---
   errors[83].code = 4205;
   errors[83].description = "Wert entsprechend dem Datum konnte nicht erhalten werden";
   errors[83].constant = "ERR_OBJECT_GETVALUE_FAILED";
   //+------------------------------------------------------------------+
   //| MarketInfo                                                       |
   //+------------------------------------------------------------------+
   errors[84].code = 4301;
   errors[84].description = "Unbekanntes Symbol";
   errors[84].constant = "ERR_MARKET_UNKNOWN_SYMBOL";
   //---
   errors[85].code = 4302;
   errors[85].description = "Symbol ist nicht im Marktübersichtsfenster ausgewählt";
   errors[85].constant = "ERR_MARKET_NOT_SELECTED";
   //---
   errors[86].code = 4303;
   errors[86].description = "Falsche ID einer Symbol-Eigenschaft";
   errors[86].constant = "ERR_MARKET_WRONG_PROPERTY";
   //---
   errors[87].code = 4304;
   errors[87].description = "Zeit des letzten Ticks ist unbekannt (keine Ticks)";
   errors[87].constant = "ERR_MARKET_LASTTIME_UNKNOWN";
   //---
   errors[88].code = 4305;
   errors[88].description = "Fehler beim Hinzufügen oder Löschen eines Symbols im Marktübersichtsfenster";
   errors[88].constant = "ERR_MARKET_SELECT_ERROR";
   //+------------------------------------------------------------------+
   //| History Access                                                   |
   //+------------------------------------------------------------------+
   errors[89].code = 4401;
   errors[89].description = "Angeforderter Verlauf nicht gefunden";
   errors[89].constant = "ERR_HISTORY_NOT_FOUND";
   //---
   errors[90].code = 4402;
   errors[90].description = "Falsche ID der Verlaufseigenschaft";
   errors[90].constant = "ERR_HISTORY_WRONG_PROPERTY";
   //---
   errors[91].code = 4403;
   errors[91].description = "Zeitüberschreitung bei der Verlaufsanfrage";
   errors[91].constant = "ERR_HISTORY_TIMEOUT";
   //---
   errors[92].code = 4404;
   errors[92].description = "Anzahl der Balken durch Terminaleinstellungen begrenzt";
   errors[92].constant = "ERR_HISTORY_BARS_LIMIT";
   //---
   errors[93].code = 4405;
   errors[93].description = "Mehrere Fehler beim Laden des Verlaufs";
   errors[93].constant = "ERR_HISTORY_LOAD_ERRORS";
   //---
   errors[94].code = 4407;
   errors[94].description = "Der Empfangsarray ist zu klein, um alle angeforderten Daten zu speichern";
   errors[94].constant = "ERR_HISTORY_SMALL_BUFFER";
   //+------------------------------------------------------------------+
   //| Global Variables                                                 |
   //+------------------------------------------------------------------+
   errors[95].code = 4501;
   errors[95].description = "Globale Variable des Client-Terminals wurde nicht gefunden";
   errors[95].constant = "ERR_GLOBALVARIABLE_NOT_FOUND";
   //---
   errors[96].code = 4502;
   errors[96].description = "Globale Variable des Client-Terminals mit demselben Namen existiert bereits";
   errors[96].constant = "ERR_GLOBALVARIABLE_EXISTS";
   //---
   errors[97].code = 4503;
   errors[97].description = "Keine Änderungen an globalen Variablen";
   errors[97].constant = "ERR_GLOBALVARIABLE_NOT_MODIFIED";
   //---
   errors[98].code = 4504;
   errors[98].description = "Datei mit Werten der globalen Variablen konnte nicht geöffnet und gelesen werden";
   errors[98].constant = "ERR_GLOBALVARIABLE_CANNOTREAD";
   //---
   errors[99].code = 4505;
   errors[99].description = "Datei mit Werten der globalen Variablen konnte nicht geschrieben werden";
   errors[99].constant = "ERR_GLOBALVARIABLE_CANNOTWRITE";
   //---
   errors[100].code = 4510;
   errors[100].description = "E-Mail-Versand fehlgeschlagen";
   errors[100].constant = "ERR_MAIL_SEND_FAILED";
   //---
   errors[101].code = 4511;
   errors[101].description = "Tonwiedergabe fehlgeschlagen";
   errors[101].constant = "ERR_PLAY_SOUND_FAILED";
   //---
   errors[102].code = 4512;
   errors[102].description = "Falsche Programm-Eigenschafts-ID";
   errors[102].constant = "ERR_MQL5_WRONG_PROPERTY";
   //---
   errors[103].code = 4513;
   errors[103].description = "Falsche Terminal-Eigenschafts-ID";
   errors[103].constant = "ERR_TERMINAL_WRONG_PROPERTY";
   //---
   errors[104].code = 4514;
   errors[104].description = "Dateiübertragung per FTP fehlgeschlagen";
   errors[104].constant = "ERR_FTP_SEND_FAILED";
   //---
   errors[105].code = 4515;
   errors[105].description = "Fehler beim Senden einer Benachrichtigung";
   errors[105].constant = "ERR_NOTIFICATION_SEND_FAILED";
   //---
   errors[106].code = 4516;
   errors[106].description = "Ungültiger Parameter zum Senden einer Benachrichtigung - eine leere Zeichenkette oder NULL wurde an die Funktion SendNotification() übergeben";
   errors[106].constant = "ERR_NOTIFICATION_WRONG_PARAMETER";
   //---
   errors[107].code = 4517;
   errors[107].description = "Falsche Benachrichtigungseinstellungen im Terminal (ID nicht angegeben oder Berechtigung nicht definiert)";
   errors[107].constant = "ERR_NOTIFICATION_WRONG_SETTINGS";
   //---
   errors[108].code = 4518;
   errors[108].description = "Zu häufiges Senden von Benachrichtigungen";
   errors[108].constant = "ERR_NOTIFICATION_TOO_FREQUENT";
   //---
   errors[109].code = 4519;
   errors[109].description = "FTP-Server ist nicht in den Konfigurationsattributen angegeben";
   errors[109].constant = "ERR_FTP_NOSERVER";
   //---
   errors[110].code = 4520;
   errors[110].description = "FTP-Login ist nicht in den Konfigurationsattributen angegeben";
   errors[110].constant = "ERR_FTP_NOLOGIN";
   //---
   errors[111].code = 4521;
   errors[111].description = "Die Datei existiert nicht";
   errors[111].constant = "ERR_FTP_FILE_ERROR";
   //---
   errors[112].code = 4522;
   errors[112].description = "Verbindung zum FTP-Server fehlgeschlagen";
   errors[112].constant = "ERR_FTP_CONNECT_FAILED";
   //---
   errors[113].code = 4523;
   errors[113].description = "Verzeichnis auf dem FTP-Server für den Datei-Upload nicht gefunden";
   errors[113].constant = "ERR_FTP_CHANGEDIR";
   //---
   errors[114].code = 4524;
   errors[114].description = "Verbindung zum FTP-Server wurde geschlossen";
   errors[114].constant = "ERR_FTP_CLOSED";
   //+------------------------------------------------------------------+
   //| Custom Indicator Buffers                                         |
   //+------------------------------------------------------------------+
   errors[115].code = 4601;
   errors[115].description = "Nicht genügend Speicher für die Zuweisung von Indikator-Puffern";
   errors[115].constant = "ERR_BUFFERS_NO_MEMORY";
   //---
   errors[116].code = 4602;
   errors[116].description = "Falscher Indikator-Puffer-Index";
   errors[116].constant = "ERR_BUFFERS_WRONG_INDEX";
   //+------------------------------------------------------------------+
   //| Custom Indicator Properties                                      |
   //+------------------------------------------------------------------+
   errors[117].code = 4603;
   errors[117].description = "Falsche ID einer Eigenschaft des benutzerdefinierten Indikators";
   errors[117].constant = "ERR_CUSTOM_WRONG_PROPERTY";
   //+------------------------------------------------------------------+
   //| Account                                                          |
   //+------------------------------------------------------------------+
   errors[118].code = 4701;
   errors[118].description = "Falsche ID einer Kontoeigenschaft";
   errors[118].constant = "ERR_ACCOUNT_WRONG_PROPERTY";
   //---
   errors[119].code = 4751;
   errors[119].description = "Falsche ID einer Handelseigenschaft";
   errors[119].constant = "ERR_TRADE_WRONG_PROPERTY";
   //---
   errors[120].code = 4752;
   errors[120].description = "Handel über Expert Advisors verboten";
   errors[120].constant = "ERR_TRADE_DISABLED";
   //---
   errors[121].code = 4753;
   errors[121].description = "Position nicht gefunden";
   errors[121].constant = "ERR_TRADE_POSITION_NOT_FOUND";
   //---
   errors[122].code = 4754;
   errors[122].description = "Auftrag nicht gefunden";
   errors[122].constant = "ERR_TRADE_ORDER_NOT_FOUND";
   //---
   errors[123].code = 4755;
   errors[123].description = "Deal nicht gefunden";
   errors[123].constant = "ERR_TRADE_DEAL_NOT_FOUND";
   //---
   errors[124].code = 4756;
   errors[124].description = "Senden der Handelsanfrage fehlgeschlagen";
   errors[124].constant = "ERR_TRADE_SEND_FAILED";
   //---
   errors[125].code = 4758;
   errors[125].description = "Handelsindexwert kann nicht berechnet werden";
   errors[125].constant = "ERR_TRADE_CALC_FAILED";
   //+------------------------------------------------------------------+
   //| Indicators                                                       |
   //+------------------------------------------------------------------+
   errors[126].code = 4801;
   errors[126].description = "Unbekanntes Symbol";
   errors[126].constant = "ERR_INDICATOR_UNKNOWN_SYMBOL";
   //---
   errors[127].code = 4802;
   errors[127].description = "Indikator kann nicht erstellt werden";
   errors[127].constant = "ERR_INDICATOR_CANNOT_CREATE";
   //---
   errors[128].code = 4803;
   errors[128].description = "Nicht genügend Speicher zum Hinzufügen des Indikators";
   errors[128].constant = "ERR_INDICATOR_NO_MEMORY";
   //---
   errors[129].code = 4804;
   errors[129].description = "Indikator kann nicht auf einen anderen Indikator angewendet werden";
   errors[129].constant = "ERR_INDICATOR_CANNOT_APPLY";
   //---
   errors[130].code = 4805;
   errors[130].description = "Fehler beim Anwenden eines Indikators auf den Chart";
   errors[130].constant = "ERR_INDICATOR_CANNOT_ADD";
   //---
   errors[131].code = 4806;
   errors[131].description = "Angeforderte Daten nicht gefunden";
   errors[131].constant = "ERR_INDICATOR_DATA_NOT_FOUND";
   //---
   errors[132].code = 4807;
   errors[132].description = "Falscher Indikator-Handle";
   errors[132].constant = "ERR_INDICATOR_WRONG_HANDLE";
   //---
   errors[133].code = 4808;
   errors[133].description = "Falsche Anzahl von Parametern beim Erstellen eines Indikators";
   errors[133].constant = "ERR_INDICATOR_WRONG_PARAMETERS";
   //---
   errors[134].code = 4809;
   errors[134].description = "Keine Parameter beim Erstellen eines Indikators";
   errors[134].constant = "ERR_INDICATOR_PARAMETERS_MISSING";
   //---
   errors[135].code = 4810;
   errors[135].description = "Der erste Parameter im Array muss der Name des benutzerdefinierten Indikators sein";
   errors[135].constant = "ERR_INDICATOR_CUSTOM_NAME";
   //---
   errors[136].code = 4811;
   errors[136].description = "Ungültiger Parametertyp im Array beim Erstellen eines Indikators";
   errors[136].constant = "ERR_INDICATOR_PARAMETER_TYPE";
   //---
   errors[137].code = 4812;
   errors[137].description = "Falscher Index des angeforderten Indikator-Puffers";
   errors[137].constant = "ERR_INDICATOR_WRONG_INDEX";
   //+------------------------------------------------------------------+
   //| Depth of Market                                                  |
   //+------------------------------------------------------------------+
   errors[138].code = 4901;
   errors[138].description = "Markttiefe kann nicht hinzugefügt werden";
   errors[138].constant = "ERR_BOOKS_CANNOT_ADD";
   //---
   errors[139].code = 4902;
   errors[139].description = "Markttiefe kann nicht entfernt werden";
   errors[139].constant = "ERR_BOOKS_CANNOT_DELETE";
   //---
   errors[140].code = 4903;
   errors[140].description = "Markttiefe-Daten können nicht erhalten werden";
   errors[140].constant = "ERR_BOOKS_CANNOT_GET";
   //---
   errors[141].code = 4904;
   errors[141].description = "Fehler beim Abonnieren für neue Markttiefe-Daten";
   errors[141].constant = "ERR_BOOKS_CANNOT_SUBSCRIBE";
   //+------------------------------------------------------------------+
   //| File Operations                                                  |
   //+------------------------------------------------------------------+
   errors[142].code = 5001;
   errors[142].description = "Mehr als 64 Dateien können nicht gleichzeitig geöffnet werden";
   errors[142].constant = "ERR_TOO_MANY_FILES";
   //---
   errors[143].code = 5002;
   errors[143].description = "Ungültiger Dateiname";
   errors[143].constant = "ERR_WRONG_FILENAME";
   //---
   errors[144].code = 5003;
   errors[144].description = "Dateiname zu lang";
   errors[144].constant = "ERR_TOO_LONG_FILENAME";
   //---
   errors[145].code = 5004;
   errors[145].description = "Fehler beim Öffnen der Datei";
   errors[145].constant = "ERR_CANNOT_OPEN_FILE";
   //---
   errors[146].code = 5005;
   errors[146].description = "Nicht genügend Cache-Speicher zum Lesen";
   errors[146].constant = "ERR_FILE_CACHEBUFFER_ERROR";
   //---
   errors[147].code = 5006;
   errors[147].description = "Fehler beim Löschen der Datei";
   errors[147].constant = "ERR_CANNOT_DELETE_FILE";
   //---
   errors[148].code = 5007;
   errors[148].description = "Eine Datei mit diesem Handle wurde geschlossen oder war einfach nicht geöffnet";
   errors[148].constant = "ERR_INVALID_FILEHANDLE";
   //---
   errors[149].code = 5008;
   errors[149].description = "Falscher Datei-Handle";
   errors[149].constant = "ERR_WRONG_FILEHANDLE";
   //---
   errors[150].code = 5009;
   errors[150].description = "Die Datei muss zum Schreiben geöffnet sein";
   errors[150].constant = "ERR_FILE_NOTTOWRITE";
   //---
   errors[151].code = 5010;
   errors[151].description = "Die Datei muss zum Lesen geöffnet sein";
   errors[151].constant = "ERR_FILE_NOTTOREAD";
   //---
   errors[152].code = 5011;
   errors[152].description = "Die Datei muss als Binärdatei geöffnet sein";
   errors[152].constant = "ERR_FILE_NOTBIN";
   //---
   errors[153].code = 5012;
   errors[153].description = "Die Datei muss als Text geöffnet sein";
   errors[153].constant = "ERR_FILE_NOTTXT";
   //---
   errors[154].code = 5013;
   errors[154].description = "Die Datei muss als Text oder CSV geöffnet sein";
   errors[154].constant = "ERR_FILE_NOTTXTORCSV";
   //---
   errors[155].code = 5014;
   errors[155].description = "Die Datei muss als CSV geöffnet sein";
   errors[155].constant = "ERR_FILE_NOTCSV";
   //---
   errors[156].code = 5015;
   errors[156].description = "Fehler beim Lesen der Datei";
   errors[156].constant = "ERR_FILE_READERROR";
   //---
   errors[157].code = 5016;
   errors[157].description = "Die Größe der Zeichenkette muss angegeben werden, da die Datei als Binärdatei geöffnet ist";
   errors[157].constant = "ERR_FILE_BINSTRINGSIZE";
   //---
   errors[158].code = 5017;
   errors[158].description = "Eine Textdatei muss für String-Arrays verwendet werden, für andere Arrays - Binärdateien";
   errors[158].constant = "ERR_INCOMPATIBLE_FILE";
   //---
   errors[159].code = 5018;
   errors[159].description = "Dies ist kein Datei, sondern ein Verzeichnis";
   errors[159].constant = "ERR_FILE_IS_DIRECTORY";
   //---
   errors[160].code = 5019;
   errors[160].description = "Datei existiert nicht";
   errors[160].constant = "ERR_FILE_NOT_EXIST";
   //---
   errors[161].code = 5020;
   errors[161].description = "Datei kann nicht überschrieben werden";
   errors[161].constant = "ERR_FILE_CANNOT_REWRITE";
   //---
   errors[162].code = 5021;
   errors[162].description = "Falscher Verzeichnisname";
   errors[162].constant = "ERR_WRONG_DIRECTORYNAME";
   //---
   errors[163].code = 5022;
   errors[163].description = "Verzeichnis existiert nicht";
   errors[163].constant = "ERR_DIRECTORY_NOT_EXIST";
   //---
   errors[164].code = 5023;
   errors[164].description = "Dies ist eine Datei, kein Verzeichnis";
   errors[164].constant = "ERR_FILE_ISNOT_DIRECTORY";
   //---
   errors[165].code = 5024;
   errors[165].description = "Das Verzeichnis kann nicht entfernt werden";
   errors[165].constant = "ERR_CANNOT_DELETE_DIRECTORY";
   //---
   errors[166].code = 5025;
   errors[166].description = "Fehler beim Leeren des Verzeichnisses (wahrscheinlich sind eine oder mehrere Dateien gesperrt und der Löschvorgang ist fehlgeschlagen)";
   errors[166].constant = "ERR_CANNOT_CLEAN_DIRECTORY";
   //---
   errors[167].code = 5026;
   errors[167].description = "Fehler beim Schreiben einer Ressource in eine Datei";
   errors[167].constant = "ERR_FILE_WRITEERROR";
   //---
   errors[168].code = 5027;
   errors[168].description = "Fehler beim Lesen des nächsten Datenblocks aus der CSV-Datei (FileReadString, FileReadNumber, FileReadDatetime, FileReadBool), da das Dateiende erreicht wurde";
   errors[168].constant = "ERR_FILE_ENDOFFILE";
   //+------------------------------------------------------------------+
   //| String Casting                                                   |
   //+------------------------------------------------------------------+
   errors[169].code = 5030;
   errors[169].description = "Kein Datum in der Zeichenkette";
   errors[169].constant = "ERR_NO_STRING_DATE";
   //---
   errors[170].code = 5031;
   errors[170].description = "Falsches Datum in der Zeichenkette";
   errors[170].constant = "ERR_WRONG_STRING_DATE";
   //---
   errors[171].code = 5032;
   errors[171].description = "Falsche Zeit in der Zeichenkette";
   errors[171].constant = "ERR_WRONG_STRING_TIME";
   //---
   errors[172].code = 5033;
   errors[172].description = "Fehler beim Konvertieren der Zeichenkette in ein Datum";
   errors[172].constant = "ERR_STRING_TIME_ERROR";
   //---
   errors[173].code = 5034;
   errors[173].description = "Nicht genügend Speicher für die Zeichenkette";
   errors[173].constant = "ERR_STRING_OUT_OF_MEMORY";
   //---
   errors[174].code = 5035;
   errors[174].description = "Die Länge der Zeichenkette ist kleiner als erwartet";
   errors[174].constant = "ERR_STRING_SMALL_LEN";
   //---
   errors[175].code = 5036;
   errors[175].description = "Zahl zu groß, größer als ULONG_MAX";
   errors[175].constant = "ERR_STRING_TOO_BIGNUMBER";
   //---
   errors[176].code = 5037;
   errors[176].description = "Ungültiges Format der Zeichenkette";
   errors[176].constant = "ERR_WRONG_FORMATSTRING";
   //---
   errors[177].code = 5038;
   errors[177].description = "Anzahl der Formatbezeichner größer als die der Parameter";
   errors[177].constant = "ERR_TOO_MANY_FORMATTERS";
   //---
   errors[178].code = 5039;
   errors[178].description = "Anzahl der Parameter größer als die der Formatbezeichner";
   errors[178].constant = "ERR_TOO_MANY_PARAMETERS";
   //---
   errors[179].code = 5040;
   errors[179].description = "Fehlerhafter Parameter vom Typ Zeichenkette";
   errors[179].constant = "ERR_WRONG_STRING_PARAMETER";
   //---
   errors[180].code = 5041;
   errors[180].description = "Position außerhalb der Zeichenkette";
   errors[180].constant = "ERR_STRINGPOS_OUTOFRANGE";
   //---
   errors[181].code = 5042;
   errors[181].description = "0 am Ende der Zeichenkette hinzugefügt, eine nutzlose Operation";
   errors[181].constant = "ERR_STRING_ZEROADDED";
   //---
   errors[182].code = 5043;
   errors[182].description = "Unbekannter Datentyp beim Konvertieren in eine Zeichenkette";
   errors[182].constant = "ERR_STRING_UNKNOWNTYPE";
   //---
   errors[183].code = 5044;
   errors[183].description = "Fehlerhaftes Zeichenkettenobjekt";
   errors[183].constant = "ERR_WRONG_STRING_OBJECT";
   //+------------------------------------------------------------------+
   //| Operations with Arrays                                           |
   //+------------------------------------------------------------------+
   errors[184].code = 5050;
   errors[184].description = "Inkompatible Arrays kopieren. Ein String-Array kann nur in ein String-Array kopiert werden, und ein numerisches Array - nur in ein numerisches Array";
   errors[184].constant = "ERR_INCOMPATIBLE_ARRAYS";
   //---
   errors[185].code = 5051;
   errors[185].description = "Der Empfangsarray ist als AS_SERIES deklariert und hat eine unzureichende Größe";
   errors[185].constant = "ERR_SMALL_ASSERIES_ARRAY";
   //---
   errors[186].code = 5052;
   errors[186].description = "Array zu klein, die Startposition liegt außerhalb des Arrays";
   errors[186].constant = "ERR_SMALL_ARRAY";
   //---
   errors[187].code = 5053;
   errors[187].description = "Ein Array mit der Länge Null";
   errors[187].constant = "ERR_ZEROSIZE_ARRAY";
   //---
   errors[188].code = 5054;
   errors[188].description = "Muss ein numerisches Array sein";
   errors[188].constant = "ERR_NUMBER_ARRAYS_ONLY";
   //---
   errors[189].code = 5055;
   errors[189].description = "Muss ein eindimensionales Array sein";
   errors[189].constant = "ERR_ONE_DIMENSIONAL_ARRAY";
   //---
   errors[190].code = 5056;
   errors[190].description = "Zeitreihe kann nicht verwendet werden";
   errors[190].constant = "ERR_SERIES_ARRAY";
   //---
   errors[191].code = 5057;
   errors[191].description = "Muss ein Array vom Typ double sein";
   errors[191].constant = "ERR_DOUBLE_ARRAY_ONLY";
   //---
   errors[192].code = 5058;
   errors[192].description = "Muss ein Array vom Typ float sein";
   errors[192].constant = "ERR_FLOAT_ARRAY_ONLY";
   //---
   errors[193].code = 5059;
   errors[193].description = "Muss ein Array vom Typ long sein";
   errors[193].constant = "ERR_LONG_ARRAY_ONLY";
   //---
   errors[194].code = 5060;
   errors[194].description = "Muss ein Array vom Typ int sein";
   errors[194].constant = "ERR_INT_ARRAY_ONLY";
   //---
   errors[195].code = 5061;
   errors[195].description = "Muss ein Array vom Typ short sein";
   errors[195].constant = "ERR_SHORT_ARRAY_ONLY";
   //---
   errors[196].code = 5062;
   errors[196].description = "Muss ein Array vom Typ char sein";
   errors[196].constant = "ERR_CHAR_ARRAY_ONLY";
   //---
   errors[197].code = 5063;
   errors[197].description = "Muss ein Array vom Typ Zeichenkette sein";
   errors[197].constant = "ERR_STRING_ARRAY_ONLY";
   //+------------------------------------------------------------------+
   //| Operations with OpenCL                                           |
   //+------------------------------------------------------------------+
   errors[198].code = 5100;
   errors[198].description = "OpenCL-Funktionen werden auf diesem Computer nicht unterstützt";
   errors[198].constant = "ERR_OPENCL_NOT_SUPPORTED";
   //---
   errors[199].code = 5101;
   errors[199].description = "Interner Fehler bei der Ausführung von OpenCL";
   errors[199].constant = "ERR_OPENCL_INTERNAL";
   //---
   errors[200].code = 5102;
   errors[200].description = "Ungültiger OpenCL-Handle";
   errors[200].constant = "ERR_OPENCL_INVALID_HANDLE";
   //---
   errors[201].code = 5103;
   errors[201].description = "Fehler beim Erstellen des OpenCL-Kontexts";
   errors[201].constant = "ERR_OPENCL_CONTEXT_CREATE";
   //---
   errors[202].code = 5104;
   errors[202].description = "Fehler beim Erstellen einer Ausführungswarteschlange in OpenCL";
   errors[202].constant = "ERR_OPENCL_QUEUE_CREATE";
   //---
   errors[203].code = 5105;
   errors[203].description = "Fehler beim Kompilieren eines OpenCL-Programms";
   errors[203].constant = "ERR_OPENCL_PROGRAM_CREATE";
   //---
   errors[204].code = 5106;
   errors[204].description = "Kernel-Name zu lang (OpenCL-Kernel)";
   errors[204].constant = "ERR_OPENCL_TOO_LONG_KERNEL_NAME";
   //---
   errors[205].code = 5107;
   errors[205].description = "Fehler beim Erstellen eines OpenCL-Kernels";
   errors[205].constant = "ERR_OPENCL_KERNEL_CREATE";
   //---
   errors[206].code = 5108;
   errors[206].description = "Fehler beim Setzen von Parametern für den OpenCL-Kernel";
   errors[206].constant = "ERR_OPENCL_SET_KERNEL_PARAMETER";
   //---
   errors[207].code = 5109;
   errors[207].description = "Fehler bei der Ausführung des OpenCL-Programms";
   errors[207].constant = "ERR_OPENCL_EXECUTE";
   //---
   errors[209].code = 5110;
   errors[209].description = "Ungültige OpenCL-Puffergröße";
   errors[209].constant = "ERR_OPENCL_WRONG_BUFFER_SIZE";
   //---
   errors[210].code = 5111;
   errors[210].description = "Ungültiger OpenCL-Puffer-Offset";
   errors[210].constant = "ERR_OPENCL_WRONG_BUFFER_OFFSET";
   //---
   errors[211].code = 5112;
   errors[211].description = "Fehler beim Erstellen eines OpenCL-Puffers";
   errors[211].constant = "ERR_OPENCL_BUFFER_CREATE";
   //---
   errors[212].code = 5113;
   errors[212].description = "Maximale Anzahl von OpenCL-Objekten überschritten";
   errors[212].constant = "ERR_OPENCL_TOO_MANY_OBJECTS";
   //---
   errors[213].code = 5114;
   errors[213].description = "Fehler bei der Auswahl des OpenCL-Geräts";
   errors[213].constant = "ERR_OPENCL_SELECTDEVICE";
   //+------------------------------------------------------------------+
   //| Working with databases                                           |
   //+------------------------------------------------------------------+
   errors[214].code = 5120;
   errors[214].description = "Interner Datenbankfehler";
   errors[214].constant = "ERR_DATABASE_INTERNAL";
   //---
   errors[215].code = 5121;
   errors[215].description = "Ungültiger Datenbank-Handle";
   errors[215].constant = "ERR_DATABASE_INVALID_HANDLE";
   //---
   errors[216].code = 5122;
   errors[216].description = "Maximale Anzahl von Datenbankobjekten überschritten";
   errors[216].constant = "ERR_DATABASE_TOO_MANY_OBJECTS";
   //---
   errors[217].code = 5123;
   errors[217].description = "Fehler beim Verbinden mit der Datenbank";
   errors[217].constant = "ERR_DATABASE_CONNECT";
   //---
   errors[218].code = 5124;
   errors[218].description = "Fehler bei der Ausführung der Abfrage";
   errors[218].constant = "ERR_DATABASE_EXECUTE";
   //---
   errors[219].code = 5125;
   errors[219].description = "Fehler beim Erstellen der Abfrage";
   errors[219].constant = "ERR_DATABASE_PREPARE";
   //---
   errors[220].code = 5126;
   errors[220].description = "Keine weiteren Daten zum Lesen";
   errors[220].constant = "ERR_DATABASE_NO_MORE_DATA";
   //---
   errors[221].code = 5127;
   errors[221].description = "Fehler beim Weiterschalten zum nächsten Datensatz der Abfrage";
   errors[221].constant = "ERR_DATABASE_STEP";
   //---
   errors[222].code = 5128;
   errors[222].description = "Daten zum Lesen der Abfrageergebnisse sind noch nicht bereit";
   errors[222].constant = "ERR_DATABASE_NOT_READY";
   //---
   errors[223].code = 5129;
   errors[223].description = "Fehler bei der automatischen Parameterersetzung in der SQL-Abfrage";
   errors[223].constant = "ERR_DATABASE_BIND_PARAMETERS";
   //+------------------------------------------------------------------+
   //| Operations with WebRequest                                       |
   //+------------------------------------------------------------------+
   errors[224].code = 5200;
   errors[224].description = "Ungültige URL";
   errors[224].constant = "ERR_WEBREQUEST_INVALID_ADDRESS";
   //---
   errors[225].code = 5201;
   errors[225].description = "Verbindung zur angegebenen URL fehlgeschlagen";
   errors[225].constant = "ERR_WEBREQUEST_CONNECT_FAILED";
   //---
   errors[226].code = 5202;
   errors[226].description = "Zeitüberschreitung";
   errors[226].constant = "ERR_WEBREQUEST_TIMEOUT";
   //---
   errors[227].code = 5203;
   errors[227].description = "HTTP-Anfrage fehlgeschlagen";
   errors[227].constant = "ERR_WEBREQUEST_REQUEST_FAILED";
   //+------------------------------------------------------------------+
   //| Operations with network (sockets)                                |
   //+------------------------------------------------------------------+
   errors[228].code = 5270;
   errors[228].description = "Der Funktion wurde ein ungültiger Socket-Handle übergeben";
   errors[228].constant = "ERR_NETSOCKET_INVALIDHANDLE";
   //---
   errors[229].code = 5271;
   errors[229].description = "Zu viele geöffnete Sockets (Maximum 128)";
   errors[229].constant = "ERR_NETSOCKET_TOO_MANY_OPENED";
   //---
   errors[230].code = 5272;
   errors[230].description = "Fehler beim Verbinden mit dem Remote-Host";
   errors[230].constant = "ERR_NETSOCKET_CANNOT_CONNECT";
   //---
   errors[231].code = 5273;
   errors[231].description = "Fehler beim Senden/Empfangen von Daten über den Socket";
   errors[231].constant = "ERR_NETSOCKET_IO_ERROR";
   //---
   errors[232].code = 5274;
   errors[232].description = "Fehler beim Herstellen einer sicheren Verbindung (TLS Handshake)";
   errors[232].constant = "ERR_NETSOCKET_HANDSHAKE_FAILED";
   //---
   errors[233].code = 5275;
   errors[233].description = "Keine Informationen über das Zertifikat, das die Verbindung schützt";
   errors[233].constant = "ERR_NETSOCKET_NO_CERTIFICATE";
   //+------------------------------------------------------------------+
   //| Custom Symbols                                                   |
   //+------------------------------------------------------------------+
   errors[234].code = 5300;
   errors[234].description = "Benutzerdefiniertes Symbol muss angegeben werden";
   errors[234].constant = "ERR_NOT_CUSTOM_SYMBOL";
   //---
   errors[235].code = 5301;
   errors[235].description = "Falscher Name des benutzerdefinierten Symbols. Im Symbolnamen können nur lateinische Zeichen ohne Interpunktion, Leerzeichen und Sonderzeichen verwendet werden ('.', '_', '&' und '#' sind erlaubt). Die Verwendung der Zeichen <, >, :, ', /, |, ?, * wird nicht empfohlen";
   errors[235].constant = "ERR_CUSTOM_SYMBOL_WRONG_NAME";
   //---
   errors[236].code = 5302;
   errors[236].description = "Name zu lang für das benutzerdefinierte Symbol. Der Name darf 32 Zeichen einschließlich des abschließenden 0 nicht überschreiten";
   errors[236].constant = "ERR_CUSTOM_SYMBOL_NAME_LONG";
   //---
   errors[237].code = 5303;
   errors[237].description = "Pfad zu lang für das benutzerdefinierte Symbol. Der Pfad darf 128 Zeichen einschließlich 'Custom\\', dem Symbolnamen, Gruppentrennern und dem abschließenden 0 nicht überschreiten";
   errors[237].constant = "ERR_CUSTOM_SYMBOL_PATH_LONG";
   //---
   errors[238].code = 5304;
   errors[238].description = "Ein benutzerdefiniertes Symbol mit diesem Namen existiert bereits";
   errors[238].constant = "ERR_CUSTOM_SYMBOL_EXIST";
   //---
   errors[239].code = 5305;
   errors[239].description = "Fehler beim Erstellen, Löschen oder Ändern des benutzerdefinierten Symbols";
   errors[239].constant = "ERR_CUSTOM_SYMBOL_ERROR";
   //---
   errors[240].code = 5306;
   errors[240].description = "Versuch, ein benutzerdefiniertes Symbol zu löschen, das in der Marktübersicht ausgewählt ist";
   errors[240].constant = "ERR_CUSTOM_SYMBOL_SELECTED";
   //---
   errors[241].code = 5307;
   errors[241].description = "Falsche Eigenschaft des benutzerdefinierten Symbols";
   errors[241].constant = "ERR_CUSTOM_SYMBOL_PROPERTY_WRONG";
   //---
   errors[242].code = 5308;
   errors[242].description = "Falscher Parameter beim Setzen der Eigenschaft des benutzerdefinierten Symbols";
   errors[242].constant = "ERR_CUSTOM_SYMBOL_PARAMETER_ERROR";
   //---
   errors[243].code = 5309;
   errors[243].description = "Parameter-Zeichenkette zu lang beim Setzen der Eigenschaft des benutzerdefinierten Symbols";
   errors[243].constant = "ERR_CUSTOM_SYMBOL_PARAMETER_LONG";
   //---
   errors[244].code = 5310;
   errors[244].description = "Tick-Array nicht nach Zeit sortiert";
   errors[244].constant = "ERR_CUSTOM_TICKS_WRONG_ORDER";
   //+------------------------------------------------------------------+
   //| Economic Calendar                                                |
   //+------------------------------------------------------------------+
   errors[245].code = 5400;
   errors[245].description = "Array-Größe unzureichend, um Beschreibungen aller Werte zu erhalten";
   errors[245].constant = "ERR_CALENDAR_MORE_DATA";
   //---
   errors[246].code = 5401;
   errors[246].description = "Zeitlimit der Anfrage überschritten";
   errors[246].constant = "ERR_CALENDAR_TIMEOUT";
   //---
   errors[247].code = 5402;
   errors[247].description = "Land nicht gefunden";
   errors[247].constant = "ERR_CALENDAR_NO_DATA";
   //+------------------------------------------------------------------+
   //| Working with databases                                           |
   //+------------------------------------------------------------------+
   errors[248].code = 5601;
   errors[248].description = "Allgemeiner Fehler";
   errors[248].constant = "ERR_DATABASE_ERROR";
   //---
   errors[249].code = 5602;
   errors[249].description = "Interner SQLite-Logikfehler";
   errors[249].constant = "ERR_DATABASE_INTERNAL";
   //---
   errors[250].code = 5603;
   errors[250].description = "Zugriff verweigert";
   errors[250].constant = "ERR_DATABASE_PERM";
   //---
   errors[251].code = 5604;
   errors[251].description = "Callback-Routine hat Abbruch angefordert";
   errors[251].constant = "ERR_DATABASE_ABORT";
   //---
   errors[252].code = 5605;
   errors[252].description = "Datenbankdatei gesperrt";
   errors[252].constant = "ERR_DATABASE_BUSY";
   //---
   errors[253].code = 5606;
   errors[253].description = "Datenbanktabelle gesperrt";
   errors[253].constant = "ERR_DATABASE_LOCKED";
   //---
   errors[254].code = 5607;
   errors[254].description = "Nicht genügend Speicher, um die Operation abzuschließen";
   errors[254].constant = "ERR_DATABASE_NOMEM";
   //---
   errors[255].code = 5608;
   errors[255].description = "Versuch, in eine schreibgeschützte Datenbank zu schreiben";
   errors[255].constant = "ERR_DATABASE_READONLY";
   //---
   errors[256].code = 5609;
   errors[256].description = "Operation durch sqlite3_interrupt() beendet";
   errors[256].constant = "ERR_DATABASE_INTERRUPT";
   //---
   errors[257].code = 5610;
   errors[257].description = "Festplatten-E/A-Fehler";
   errors[257].constant = "ERR_DATABASE_IOERR";
   //---
   errors[258].code = 5611;
   errors[258].description = "Datenbankabbild beschädigt";
   errors[258].constant = "ERR_DATABASE_CORRUPT";
   //---
   errors[259].code = 5612;
   errors[259].description = "Unbekannter Operationscode in sqlite3_file_control()";
   errors[259].constant = "ERR_DATABASE_NOTFOUND";
   //---
   errors[260].code = 5613;
   errors[260].description = "Einfügung fehlgeschlagen, da die Datenbank voll ist";
   errors[260].constant = "ERR_DATABASE_FULL";
   //---
   errors[261].code = 5614;
   errors[261].description = "Não é possível abrir o arquivo de banco de dados";
   errors[261].constant = "ERR_DATABASE_CANTOPEN";
   //---
   errors[262].code = 5615;
   errors[262].description = "Erro de protocolo de bloqueio de banco de dados";
   errors[262].constant = "ERR_DATABASE_PROTOCOL";
   //---
   errors[263].code = 5616;
   errors[263].description = "Somente para uso interno";
   errors[263].constant = "ERR_DATABASE_EMPTY";
   //---
   errors[264].code = 5617;
   errors[264].description = "Esquema de banco de dados alterado";
   errors[264].constant = "ERR_DATABASE_SCHEMA";
   //---
   errors[265].code = 5618;
   errors[265].description = "String ou BLOB excede o limite de tamanho";
   errors[265].constant = "ERR_DATABASE_TOOBIG";
   //---
   errors[266].code = 5619;
   errors[266].description = "Abortar devido a violação de restrição";
   errors[266].constant = "ERR_DATABASE_CONSTRAINT";
   //---
   errors[267].code = 5620;
   errors[267].description = "Incompatibilidade de tipo de dados";
   errors[267].constant = "ERR_DATABASE_MISMATCH";
   //---
   errors[268].code = 5621;
   errors[268].description = "Bibliothek falsch verwendet";
   errors[268].constant = "ERR_DATABASE_MISUSE";
   //---
   errors[269].code = 5622;
   errors[269].description = "Verwendet Betriebssystemressourcen, die auf dem Host nicht unterstützt werden";
   errors[269].constant = "ERR_DATABASE_NOLFS";
   //---
   errors[270].code = 5623;
   errors[270].description = "Autorisierung verweigert";
   errors[270].constant = "ERR_DATABASE_AUTH";
   //---
   errors[271].code = 5624;
   errors[271].description = "Não usado";
   errors[271].constant = "ERR_DATABASE_FORMAT";
   //---
   errors[272].code = 5625;
   errors[272].description = "Fehler beim Parameter-Binding, falscher Index";
   errors[272].constant = "ERR_DATABASE_RANGE";
   //---
   errors[273].code = 5626;
   errors[273].description = "Geöffnete Datei ist keine Datenbankdatei";
   errors[273].constant = "ERR_DATABASE_NOTADB";
  }
//+------------------------------------------------------------------+

