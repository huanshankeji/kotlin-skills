#!/bin/sh
p=huanshankeji-kotlin-skills
cd "$(dirname "$0")" || exit
zip -r -FS "$OLDPWD/$p.zip" plugin.json .codex-plugin skills LICENSE
