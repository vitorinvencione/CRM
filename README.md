# Protótipo de Segmentação — deploy na Vercel

Pasta pronta para virar um repositório. O `index.html` é uma cópia de
`../prototipo-segmentacao.html`, que continua sendo a fonte da verdade.

## Primeira vez

No terminal, dentro desta pasta:

```bash
git init
git add -A
git commit -m "protótipo de segmentação CRM"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/SEU-REPO.git
git push -u origin main
```

Depois me mande o `usuario/repo` que eu conecto na Vercel e devolvo a URL.

> Se ainda não criou o repositório: github.com/new → pode ser **privado**,
> a Vercel consegue publicar mesmo assim. Não marque "Add a README".

## Nas próximas vezes

```bash
./atualizar.sh "o que mudou"
```

O script recopia o protótipo, commita e dá push. A Vercel publica sozinha
em cerca de 30 segundos, na mesma URL.

## Por que `vercel.json`

Só desliga o cache (`no-store`). Em teste de usabilidade isso importa: sem
isso, um participante que abriu o link ontem pode receber a versão antiga
do navegador e testar uma tela que não existe mais.

## Sobre a URL

O deploy de produção fica numa URL fixa — é essa que você manda para os
participantes. Cada push também gera uma URL de preview própria, útil para
comparar duas versões lado a lado num teste A/B.
