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

## Сценарии

В зале все делают [scenario01.md](scenario01.md). Если агент ещё не отвечает по модели, сначала [scenario02.md](scenario02.md).

| | Файл | Когда |
| --- | --- | --- |
| 01 | [scenario01.md](scenario01.md) | общий, после сверки |
| 02 | [scenario02.md](scenario02.md) | разогрев, достаточно опубликованного проекта |
| 03 | [scenario03.md](scenario03.md) | код сервиса orders против модели. Кода магазина в этом репозитории нет: агенту нужен открытый репозиторий магазина |
| 04 | [scenario04.md](scenario04.md) | черновик полки рекомендаций |
| 05 | [scenario05.md](scenario05.md) | комментарий к устному pull request |
| 06 | [scenario06.md](scenario06.md) | новый атрибут метамодели. После сверки, на своей модели, не на `WS_STEP1` / `WS_STEP2` |
| 07 | [scenario07.md](scenario07.md) | правка архитектуры после изменения кода. Тоже после сверки и не на контрольных моделях |

Агент готовит текст или черновик канваса. **Сохранить** нажимаем сами. Шпаргалка: [cheatsheet.md](cheatsheet.md).
