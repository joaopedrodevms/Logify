# Logify

**Logify** é uma biblioteca modular de logging para MQL5, projetada para fornecer controle detalhado, flexível e extensível sobre o fluxo de logs em Expert Advisors, indicadores e scripts. Com suporte para múltiplos manipuladores, níveis de log configuráveis e formatação customizável, Logify permite que você trate logs como uma ferramenta estratégica de desenvolvimento e monitoramento.

## ✨ Funcionalidades

- ✅ **Log modular** com suporte a múltiplos destinos simultâneos (console, arquivo, banco de dados)
- ✅ **Níveis de log configuráveis** (debug, info, warning, error, critical)
- ✅ **Formato de mensagem customizável** via `LogifyFormatter`
- ✅ **Manipuladores reutilizáveis e extensíveis** por meio de herança
- ✅ **Utilitários de tempo** com `IntervalWatcher` para medições de desempenho
- ✅ **Sistema de atualização controlada** com `Update`
- ✅ **Design desacoplado e orientado a interfaces**
- ✅ **Compatível com qualquer tipo de aplicação MQL5** (EA, indicador, script)

## ⚙️ Como funciona

1. `Logify` (classe principal): Gerencia o fluxo central dos logs. Armazena uma lista de manipuladores (Handlers) e distribui para eles cada entrada de log, se o nível mínimo configurado for respeitado.

2. `LogifyHandler` (classe base abstrata): Define a interface que todos os manipuladores devem implementar. Cada manipulador representa um destino (console, arquivo, banco de dados, etc).

3. `LogifyModel`: Modela cada entrada de log: timestamp, nível, mensagem formatada, entre outros dados.

4. `LogifyFormatter`: Controla como a mensagem será montada antes de ser enviada aos handlers. Pode ser customizado.


## 📖 Guia de Instalação

1. Abra a pasta de Dados do seu terminal Metatrader5
2. Navegue até `MQL5/Includes`
1. Clone o projeto dentro da pasta `/Includes` do seu Terminal Metatrader5
``` shell
git clone https://github.com/github-joao-pedro/Logify.git
```

## 🧩 Manipuladores
Manipuladores são responsáveis por despachar logs para destinos específicos. Logify inclui:


| Handler | Destino | Comentário | Ideal para... |
| :- | :- | :- | :- |
| `LogifyHandlerConsole` | Console do MetaTrader | Envia logs diretamente para o console (Janela de Experts ou Testador). Extremamente rápido e útil durante desenvolvimento e debug local. | Debug interativo, testes rápidos |
| `LogifyHandlerFile` |Arquivo na pasta `Files` | Salva os logs em um arquivo simples. Permite manter histórico local, facilita auditoria básica e debug assíncrono. | Execução ao vivo, backtests, logging contínuo |
| `LogifyHandlerDatabase` | Banco de dados (personalizável) | Permite integração com bancos de dados em arquivos. | Grande volumes de dados, gerenciar logs de vários robôs |


Voce pode também criar seus próprios manipuladores herdando da classe base `LogifyHandler`.

## 📊 Níveis de Log Suportados

| Nível         | Constante               | Descrição                                 |
|---------------|-------------------------|-------------------------------------------|
| DEBUG         | `LOG_LEVEL_DEBUG`       | Informações detalhadas para debug interno |
| INFO          | `LOG_LEVEL_INFO`        | Eventos normais de execução               |
| WARNING       | `LOG_LEVEL_WARNING`     | Algo inesperado, mas não fatal            |
| ERROR         | `LOG_LEVEL_ERROR`       | Erro que impacta funcionalidade           |
| CRITICAL/FATAL| `LOG_LEVEL_FATAL`       | Erro grave. Interrupção ou falha crítica  |

Cada handler pode ter seu próprio nível de log configurado de forma independente, permitindo filtragens específicas por destino. Por exemplo: você pode gravar apenas erros em arquivo para auditoria, exibir informações gerais no console para acompanhamento em tempo real, e registrar todos os eventos, inclusive os de depuração em um banco de dados para análise histórica completa.


## 📦 Estrutura

```
| 📂 Logify/
| └── 📂 Languages/
| ├──├── ErrorMessages.de.mqh   # Mensagens de erro em alemão
| ├──├── ErrorMessages.en.mqh   # Mensagens de erro em ingles
| ├──├── ErrorMessages.es.mqh   # Mensagens de erro em espanhol
| ├──├── ErrorMessages.fr.mqh   # Mensagens de erro em françes
| ├──├── ErrorMessages.it.mqh   # Mensagens de erro em italiano
| ├──├── ErrorMessages.ja.mqh   # Mensagens de erro em japones
| ├──├── ErrorMessages.ko.mqh   # Mensagens de erro em koreano
| ├──├── ErrorMessages.pt.mqh   # Mensagens de erro em portugues
| ├──├── ErrorMessages.ru.mqh   # Mensagens de erro em russo
| ├──├── ErrorMessages.tr.mqh   # Mensagens de erro em turco
| ├──└── ErrorMessages.zh.mqh   # Mensagens de erro em chines
│ ├── Error.mqh                 # Define o formato da saída de logs
│ └── LogifyError.mqh           # Define o formato da saída de logs
│
├── 📂 Formatter/
│ └── LogifyFormatter.mqh       # Define o formato da saída de logs
│
├── 📂 Handlers/
│ ├── LogifyHandler.mqh         # Interface base para manipuladores de log
│ ├── LogifyHandlerConsole.mqh  # Saída para o log do terminal MetaTrader
│ ├── LogifyHandlerDatabase.mqh # Suporte para persistência em banco de dados
│ ├── LogifyHandlerFile.mqh     # Escrita de logs em arquivos locais
│
├── 📂 Utils/
│ ├── IntervalWatcher.mqh       # Utilitário para medir tempo entre eventos
│ └── Update.mqh                # Utilitário para atualização de estados/logs
│
├── Logify.mqh                  # Classe principal que orquestra os logs
├── LogifyLevel.mqh             # Enumeração e definição de níveis de log
└── LogifyModel.mqh             # Estrutura de dados para representar uma entrada de log
```

## 👨🏻‍💻 Exemplo de Uso

### Console
``` c++
#include <Logify/Logify.mqh>
CLogify logify;

int OnInit()
  {
   //--- Handler Console
   CLogifyHandlerConsole *handler_console = new CLogifyHandlerConsole();
   handler_console.SetFormatter(new CLogifyFormatter("hh:mm:ss","{date_time} [{levelname}] {msg}"));
   handler_console.SetLevel(LOG_LEVEL_DEBUG);
   
   //--- Add handler in base class
   logify.AddHandler(handler_console);
   
   //--- Using logs
   logify.Info("Purchase order sent successfully", "Order Manager", "Symbol: EURUSD, Volume: 0.1");

   
   return(INIT_SUCCEEDED);
  }
```

### Arquivo
``` c++
#include <Logify/Logify.mqh>
CLogify logify;

int OnInit()
  {
   //--- Configs
   MqlLogifyHandleFileConfig handler_file_config;
   handler_file_config.CreateSizeRotationConfig("expert","logs",LOG_FILE_EXTENSION_LOG,5,5,10);
   
   //--- Handler File
   CLogifyHandlerFile *handler_file = new CLogifyHandlerFile();
   handler_file.SetConfig(handler_file_config);
   handler_file.SetFormatter(new CLogifyFormatter("hh:mm:ss","{date_time} [{levelname}] {msg}"));
   handler_file.SetLevel(LOG_LEVEL_DEBUG);
   
   //--- Add handler in base class
   logify.AddHandler(handler_file);
   
   //--- Using logs
   logify.Info("Purchase order sent successfully", "Order Manager", "Symbol: EURUSD, Volume: 0.1");
   
   return(INIT_SUCCEEDED);
  }
```

### Banco de Dados
``` c++
#include <Logify/Logify.mqh>
CLogify logify;

int OnInit()
  {
   //--- Configs
   MqlLogifyHandleDatabaseConfig m_config;
   m_config.directory = "db";
   m_config.base_filename = "logs";
   m_config.messages_per_flush = 5;
   
   //--- Handler Database
   CLogifyHandlerDatabase *handler_database = new CLogifyHandlerDatabase();
   handler_database.SetConfig(m_config);
   handler_database.SetLevel(LOG_LEVEL_DEBUG);
   handler_database.SetFormatter(new CLogifyFormatter("hh:mm:ss","{date_time} [{levelname}] {msg}"));
   
   //--- Add handler in base class
   logify.AddHandler(handler_database);
   
   //--- Using logs
   logify.Info("Purchase order sent successfully", "Order Manager", "Symbol: EURUSD, Volume: 0.1");
   
   return(INIT_SUCCEEDED);
  }
```

### Varios handlers ao mesmo tempo
``` c++
#include <Logify/Logify.mqh>
CLogify logify;

int OnInit()
  {
   //--- Handler Console
   CLogifyHandlerConsole *handler_console = new CLogifyHandlerConsole();
   handler_console.SetFormatter(new CLogifyFormatter("hh:mm:ss","[{levelname}] {msg}"));
   handler_console.SetLevel(LOG_LEVEL_INFO);
   
   //--- Handler File
   MqlLogifyHandleFileConfig handler_file_config;
   handler_file_config.CreateSizeRotationConfig("errors","logs",LOG_FILE_EXTENSION_LOG,5,5,10);
   CLogifyHandlerFile *handler_file = new CLogifyHandlerFile();
   handler_file.SetConfig(handler_file_config);
   handler_file.SetFormatter(new CLogifyFormatter("hh:mm:ss","{date_time} [{levelname}] {msg}"));
   handler_file.SetLevel(LOG_LEVEL_ERROR);
   
   //--- Handler Database
   MqlLogifyHandleDatabaseConfig m_config;
   m_config.directory = "db";
   m_config.base_filename = "logs";
   m_config.messages_per_flush = 5;
   CLogifyHandlerDatabase *handler_database = new CLogifyHandlerDatabase();
   handler_database.SetConfig(m_config);
   handler_database.SetLevel(LOG_LEVEL_DEBUG);
   handler_database.SetFormatter(new CLogifyFormatter("hh:mm:ss","{date_time} [{levelname}] {msg}"));
   
   //--- Add handlers in base class
   logify.AddHandler(handler_console);
   logify.AddHandler(handler_file);
   logify.AddHandler(handler_database);
   
   //--- Using logs
   logify.Debug("RSI indicator value calculated: 72.56", "Indicators", "Period: 14");
   logify.Info("Buy order sent successfully", "Order Management", "Symbol: EURUSD, Volume: 0.1");
   logify.Alert("Stop Loss adjusted to breakeven level", "Risk Management", "Order ID: 12345678");
   logify.Error("Failed to send sell order", "Order Management", "Reason: Insufficient balance");
   logify.Fatal("Failed to initialize EA: Invalid settings", "Initialization", "Missing or incorrect parameters");

   return(INIT_SUCCEEDED);
  }
```



## 🤝 Contribuindo

Contribuições são bem-vindas!

Sinta-se à vontade para abrir um problema ou enviar uma solicitação de pull request com melhorias ou correções.

## 📝Licença

A biblioteca Logify é lançada sob a licença do MIT. Consulte [LICENSE](./LICENSE) para obter detalhes.