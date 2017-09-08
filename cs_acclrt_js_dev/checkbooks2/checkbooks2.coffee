createAccount = ({name})->
  {
    name: name
    balance: 0

    description: ->
      "#{@name}: #{dollarsToString(@balance)}"

    deposit: ({amount})->
      @balance += amount
      saveState()
      @

    withdraw: ({amount})->
      @balance += amount
      saveState()
      @

    transfer: ({toAccount, amount})->
      @balance -= amount
      toAccount.balance += amount
      saveState()
      @
  }

accounts = [
  createAccount({name: 'Checking'})
  createAccount({name: 'Savings'})
  createAccount({name: 'Mattress'})
]

inquirer = require('inquirer')

# prompt gives 'answers' to 'postActionStep'
# 'answers' has 'account' and 'action' properties
# prompt can take a list of prompts and put answers
# together
mainStep = ->
  inquirer.prompt([
    makeAccountPrompt()
    makeActionPrompt()
  ]).then(postActionStep)

postActionStep = ({account, action})->
  prompts = [makeAmountPrompt({action})]
  if action is 'transfer'
    prompts.unshift makeToAccountPrompt({fromAccount: account})
  inquirer.prompt(prompts).then(({amount, toAccount})->
    amount = inputToNumber(amount)
    account[action]({amount, toAccount})
    mainStep()
  )

makeAccountPrompt = ->
  {
    name: 'account'
    message: 'Pick an account:'
    type: 'list'
    choices: for account in accounts
      {name: account.description(), value: account}
  }

makeActionPrompt = ->
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

makeToAccountPrompt = ({fromAccount})->
  {
    name: 'toAccount'
    message: 'Pick an account to transfer $ to:'
    type: 'list'
    choices: for account in accounts when account isnt fromAccount
      {name: account.description(), value: account}
  }

makeAmountPrompt = ({action})->
  {
    name: 'amount'
    message: "Enter the amount to #{action}:"
    type: 'input'
    validate: (input)=>
      if isNaN(inputToNumber(input))
        return 'Please enter a numerical amount.'
      if inputToNumber(input) < 0
        return 'Please enter a non-negative amount.'
      true
  }

numeral = require('numeral')
jsonfile = require('jsonfile')

dollarsToString = (dollars)->
  numeral(dollars).format('$0,0.00')

inputToNumber = (input)->
  parseFloat input.replace(/[$,]/g, ''), 10

saveState = ->
  jsonfile.writeFileSync('./data.json', accounts)

try
  data = jsonfile.readFileSync('./data.json')
  for account, i in accounts
    account.balance = data[i].balance

mainStep()
