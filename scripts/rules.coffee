# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->


  robot.hear /kurw/i, (res) ->
     res.send "Nie przeklinaj!"

  robot.hear /pizd/i, (res) ->
     res.send "Nie przeklinaj!"

  robot.hear /pierdol/i, (res) ->
     res.send "Nie przeklinaj!"

  robot.hear /sex/i, (res) ->
     res.send "A fuuuuu!!!"

  czesc_powitania = ['Witaj!', 'Hej!', 'Czolem!', 'Siema!']

  robot.hear /jest ktos/i, (res) ->
     res.send "Ja jestem :D"

  robot.hear /siema/i, (res) ->
     res.send res.random czesc_powitania

  robot.hear /dzin dybry/i, (res) ->
     res.send res.random czesc_powitania

  robot.hear /dzien dobry/i, (res) ->
     res.send res.random czesc_powitania

  robot.hear /(.*) dola/i, (res) ->
       res.emote "serio?!"

  robot.hear /zle (.*) czuje/i, (res) ->
       res.emote "no juz dobrze, trzymaj sie..."

  lulz = ['lol', 'rofl', 'lmao']

  robot.respond /lol/i, (res) ->
     res.send res.random lulz

  robot.respond /lulz/i, (res) ->
     res.send res.random lulz

  robot.topic (res) ->
     res.send "#{res.message.text}? Fajny topic"

  powitania = ['Witaj!', 'Hej!', 'Czolem!', 'Witamy na kanale!']
  pozegnania = ['Zegnaj', 'Czesc, dozo...', 'Do zobaczenia...', 'Nie odchodz!']

  robot.enter (res) ->
     res.reply res.random powitania
  robot.leave (res) ->
     res.reply res.random pozegnania

  pocieszenia = ['Nie boj zaby, bedzie dobrze', 'No juz, usmiechnij sie!', 'Wszystko bedzie spoko', 'Nie lam sie!']

  robot.respond /pociesz mnie/i, (res) ->
     res.send res.random pocieszenia

  robot.respond /jestes troche wolny/, (res) ->
     setTimeout () ->
       res.send "Kogo nazywasz 'wolny'?"
     , 60 * 1000

  robot.error (err, res) ->
     robot.logger.error "DOES NOT COMPUTE"
     if res?
      res.reply "DOES NOT COMPUTE"

  robot.respond /(.*) piwo/i, (res) ->
     # Get number of sodas had (coerced to a number).
     sodasHad = robot.brain.get('totalSodas') * 1 or 0

     if sodasHad > 3
       res.reply "Jestem zbyt pijany.."

     else
       res.reply 'Pewnie, dzieki!'
       robot.brain.set 'totalSodas', sodasHad+1
  #
  robot.respond /odespij/i, (res) ->
     robot.brain.set 'totalSodas', 0
     res.reply 'zzzzz'
