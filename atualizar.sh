#!/bin/bash
# Copia a versão mais recente do protótipo para cá e publica.
# A fonte da verdade continua sendo ../prototipo-segmentacao.html —
# o index.html daqui é só a cópia que a Vercel serve.
set -e
cd "$(dirname "$0")"

cp ../prototipo-segmentacao.html index.html
echo "index.html atualizado ($(wc -c < index.html) bytes)"

git add -A
git commit -m "${1:-atualiza protótipo de segmentação}"
git push

echo
echo "Push feito. A Vercel publica sozinha em ~30s."
