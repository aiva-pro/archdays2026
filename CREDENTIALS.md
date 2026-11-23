# Что приходит на карточке

Значения здесь не заполняются. Ведущий выдаёт карточку отдельно. В git этого репозитория не коммитьте логины, пароли и токены.

| Поле | Куда подставлять | Пример формы, не значение |
| --- | --- | --- |
| URL AIVA | браузер, вход | https://archdays2026.aiva-pro.tech |
| Логин | форма входа | персональный |
| Пароль | форма входа | персональный |
| Организация | после входа, своя | `ws-team-07` |
| Код модели | **Модели → Создать модель** | `WS_TEAM_07` |
| Витрина | браузер | https://ecomarch.aiva-pro.tech |
| Статус сервисов | браузер | https://ecomarch.aiva-pro.tech/status |
| Письма после заказа | браузер | https://ecomarch.aiva-pro.tech/outbox/ |
| Docker API | **Интеграции → Источники** | `http://<хост>:50006` |
| Namespace | метка `aiva.system` | с карточки |
| MCP endpoint | [mcp/cursor.json](mcp/cursor.json) или [mcp/claudecode.json](mcp/claudecode.json) | `<AIVA_MCP_URL>` |
| Токен MCP | заголовок `Authorization: Bearer …` | `<AIVA_TOKEN>` |

Токен привязан к юниту команды. `unit_id` в конфиге не указывается.
