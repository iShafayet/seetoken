
commander = require 'commander'
fs = require 'fs'
path = require 'path'

{ Seetoken } = require './index'

encase = (str)-> str.toLowerCase()

commander.version '0.0.1'

commander.option '--encoding <string>', encase 'Preferred Encoding (defaults to "utf8")'

commander.parse process.argv

encoding = commander.encoding or 'utf8'

getValidatedSource = (source)->

  source = path.normalize source

  unless fs.existsSync source
    console.log "Source '#{source}' does not exist"
    process.exit(3)

  stat = fs.statSync source
  unless stat.isFile()
    console.log "Source '#{source}' is not a file"
    process.exit(4)

  return source

if commander.args.length is 0
  console.log 'Insufficient Argument(s)'
  process.exit(2)

source = getValidatedSource commander.args[0]

contents = fs.readFileSync source, { encoding: encoding }

console.log Seetoken.tokenize contents, { color: true }

