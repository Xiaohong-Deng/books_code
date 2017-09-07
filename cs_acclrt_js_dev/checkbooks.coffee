createAccount = (name)->
  {
    name: name
    balance: 0

    description: ->
      "#{@name}: #{dollarsToString(@balance)}"

    deposit: (amount) ->
      @balance += amount
      @

    withdraw: (amount) ->
      @balance -= amount
      @
  }

checking = createAccount('Checking')
savings = createAccount('Savings')
mattress = createAccount('Mattress')
