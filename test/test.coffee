
{ expect } = require('chai')

{ Seetoken } = require './../index.coffee'

fs = require 'fs'

describe 'Seetoken', ->

  it 'Work in progress', ->

    input = fs.readFileSync './test/sample-files/demo.cohtml', 'utf8'

    Seetoken.display input


