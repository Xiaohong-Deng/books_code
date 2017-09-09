numeral = require('numeral')

module.exports =
  dollarsToString: (dollars)->
    numeral(dollars).format('$0,0.00')

  inputToNumber: (input)->
    parseFloat input.replace(/[$,]/g), 10
