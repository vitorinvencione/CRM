#!/bin/bash
# Publica a versão mais recente do protótipo na Vercel.
#
# A fonte da verdade é ../prototipo-segmentacao.html — o index.html daqui é só
# a cópia que a Vercel serve.
#
# O script é seguro de rodar a qualquer momento, inclusive quando o Claude já
# copiou e commitou: ele só commita se houver mudança e SEMPRE tenta o push.
# (Antes, com "git commit" solto e set -e, rodar sem mudança abortava o script
#  antes do push — e você achava que tinha publicado sem ter publicado.)
set -e
cd "$(dirname "$0")"

cp ../prototipo-segmentacao.html index.html
echo "index.html: $(wc -c < index.html | tr -d ' ') bytes"

git add -A
if git diff --cached --quiet; then
  echo "Nada novo para commitar — o commit já estava feito."
else
  git commit -q -m "${1:-atualiza protótipo de segmentação}"
  echo "Commit criado."
fi

pendentes=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo "?")
if [ "$pendentes" = "0" ]; then
  echo
  echo "Nada pendente: a Vercel já está com a versão mais recente."
  exit 0
fi

echo "Enviando $pendentes commit(s)..."
git push

echo
echo "Push feito. A Vercel publica sozinha em ~30s."
echo "Confira numa aba anônima para garantir que o link está aberto para o time."
