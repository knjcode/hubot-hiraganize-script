# hubot-hiraganize-script

[mecab-api-hiragana](https://github.com/knjcode/mecab-api-hiragana)を利用してチャット上の発言をひらがな、カタカナに変換します

## インストール

npmでインストール

```bash
$ cd /path/to/hubot
$ npm install --save knjcode/hubot-hiraganize-script
```

`external-scripts.json`へスクリプトを登録

```bash
$ cat external-scripts.json
["hubot-hiraganize-script"]
```

## 使い方

hiragana でひらがな化、 katakana でカタカナ化します。

```bash
user1>> hubot hiragana 漢字が混ざっている文章
hubot>> かんじが まざっている ぶんしょう

user1>> hubot katakana 幽遊白書
hubot>> ユウユウハクショ
```

## 環境変数設定

**MECAB_API_HIRAGANA_URL** mecab-api-hiraganaのURL

**MECAB_API_HIRAGANA_NORMALIZE** 文字列の正規化有無(true or false)
