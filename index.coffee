
colors = require('colors/safe')

class Seetoken
  constructor: ->

  @tokenize: (string, opt = {})->

    { colorize } = opt
    colorize or= true

    charArray = string.split ''

    for char, index in charArray
      if char is ' '
        char = '[S]'
        char = (colors.cyan char) if colorize
      else if char is '\t'
        char = '[T]'
        char = (colors.bgRed char) if colorize
      else if char is '\n'
        char = '[N]'
        char = (colors.bgRed char) if colorize
        char += '\n'
      else if char is '\r'
        char = '[C]'
        char = (colors.bgRed char) if colorize
      else if char in [ '=', '"', '\'',',','.', '$' ]
        char = "[#{char}]"
        char = (colors.bgBlue char) if colorize
      else
        char = ' ' + char + ' '
        # char = (colors.bgMagenta char) if colorize

      charArray[index] = char

    string = charArray.join ''
    return string

@Seetoken = Seetoken  
