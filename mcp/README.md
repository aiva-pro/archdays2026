# Подключение агента

Данные с карточки. В файлы ниже подставьте их сами и не коммитьте результат.

```
MCP endpoint:  <AIVA_MCP_URL>
Токен:         <AIVA_TOKEN>
```

## Cursor

[cursor.json](cursor.json) положите в `~/.cursor/mcp.json` или в `.cursor/mcp.json` проекта. Подставьте endpoint и токен, перезапустите Cursor. Сервер появится в Settings → MCP.

## Claude Code

[claudecode.json](claudecode.json) положите в корень рабочей папки под именем `.mcp.json`.

```bash
cp mcp/claudecode.json .mcp.json
```

Отредактируйте `<AIVA_MCP_URL>` и `<AIVA_TOKEN>`, затем запустите `claude`. При первом запуске подтвердите сервер.

Одной командой:

```bash
claude mcp add --transport http aiva <AIVA_MCP_URL> --header "Authorization: Bearer <AIVA_TOKEN>"
```

Проверка: «покажи мои модели в aiva» — должен вернуться список.

Другой клиент в этих материалах не описан. Формат тот же: HTTP, адрес MCP и заголовок `Authorization: Bearer <токен>`.

Если не подключается — таблица в [../files/FAQ.md](../files/FAQ.md).

Агент готовит текст или черновик канваса. **Сохранить** нажимаете вы. Формулировки: [cheatsheet.md](cheatsheet.md).
