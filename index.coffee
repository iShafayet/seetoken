

class Seetoken
  constructor: ->

  @display: (string)->


    charArray = string.split ''

    for char, index in charArray
      if char is ' '
        char = '[S]'
      else if char is '\t'
        char = '[T]'
      else if char is '\n'
        char = '[N]\n'
      else if char is '\r'
        char = '[C]'
      else if char in [ '=', '"', '\'',',','.', '$' ]
        char = "[#{char}]"
      else
        char = ' ' + char + ' '

      charArray[index] = char

    string = charArray.join ''
    console.log string


@Seetoken = Seetoken  
