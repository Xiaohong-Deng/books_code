utils = require('./utils')

class PromptFactory
  constructor: ({@allAccounts}) ->

  accountPrompt: ->
    {
      name: 'account'
      message: 'Pick an account:'
      type: 'list'
      choices: (for account in @allAccounts
        {name: account.description(), value: account}
      ).concat({name: 'new account', value: null})
    }

  newAccountPrompt: ->
    {
      name: 'name'
      message: 'Enter a name for this account:'
      type: 'input'
      # this fat arrow makes the method 'this'
      # to where it is defined. 'where' means
      # the scope one layer above
      # which is the instance method newAccountPrompt
      validate: (input)=>
        for account in @allAccounts
          if account.name is input
            return 'That account name is already taken!'
        true
    }

  actionPrompt: ->
    {
      name: 'action'
      message: 'Pick an action:'
      type: 'list'
      choices: [
        {name: 'Deposit $ into this account', value: 'deposit'}
        {name: 'Withdraw $ from this account', value: 'withdraw'}
        {name: 'Transfer $ to another account', value: 'transfer'}
      ]
    }

  toAccountPrompt: ({fromAccount})->
    {
      name: 'toAccount'
      message: 'Pick an account to transfer $ to:'
      type: 'list'
      choices: for account in allAccounts when account isnt fromAccount
        {name: account.description(), value: account}
    }

  amountPrompt: ({action})->
    {
      name: 'amount'
      message: 'Enter the amount to #{action}'
      type: 'input'
      validate: (input)=>
        if isNaN(inputToNumber(input))
          return 'Please enter a numerical amount.'
        if inputToNumber(input) < 0
          return 'Please enter a non-negative amount.'
        true
    }

module.exports = PromptFactory
