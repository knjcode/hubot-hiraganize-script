# Description
#   発言をひらがな、カタカナに変換します
#
# Configuration:
#   MECAB_API_HIRAGANA_URL       - mecab-api-hiraganaのURL
#   MECAB_API_HIRAGANA_NORMALIZE - 文字列の正規化有無(true or false)
#
# Commands:
#   hubot hiragana <string> - 発言をひらがなに変換
#   hubot katakana <string> - 発言をカタカナに変換
#
# Author:
#   knjcode <knjcode@gmail.com>

baseUrl = process.env.MECAB_API_HIRAGANA_URL
if !baseUrl
  console.error("ERROR: You should set MECAB_API_HIRAGANA_URL env variables.")

doNormalize = false
if process.env.MECAB_API_HIRAGANA_NORMALIZE is 'true'
  doNormalize = true

module.exports = (robot) ->
  robot.respond /(hiragana|katakana) (.*)/i, (msg) ->
    if !baseUrl
      robot.logger.error("You should set MECAB_API_HIRAGANA_URL env variables.")
      return
    data = JSON.stringify {
        "sentence": msg.match[2]
        "output_type": msg.match[1]
        "normalize": doNormalize
    }

    robot.http(baseUrl+"/hiragana")
      .header("Content-type", "application/json")
      .post(data) (err, res, body) ->
        if err
          robot.logger.error("#{err}")
          return
        try
          result = JSON.parse(body)
          msg.send(result.converted)
        catch e
          robot.logger.error("#{e}")
