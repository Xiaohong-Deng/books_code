console.log 'Hello, functions!'
console.log (->
  "Hello, IIFE"
)()

greet = (subject)->
  "Hello, #{subject}!"
console.log greet 'argument'

getCurrentDate = ->
  now = new Date
  "#{now.getMonth()}/#{now.getDay()}, #{now.getFullYear()}"
console.log getCurrentDate()

pluralize = (count, word, suffix = 's')->
  if count is 1
    word
  else
    word + suffix

dinner = undefined
dinner ?= "macAndCheese"
buyAnything = (retailer = 'amazon')->
  # ...

showOff = (allArguments...)->
  console.log allArguments
showOff()
# turn a list of separate args into an array
# list here doesn't refer to a data structure
# only has literal meaning
showOff('once', 'twice', 'thrice')

numbers = [5.4, 9.4, 1.8, 2.2]
# turn an array into a list of separate args
# feels like ref and deref right? except it uses
# the same operator
console.log Math.min(numbers...)

X = 5
sumXY = ->
  X + Y
Y = 7
console.log sumXY()
# function not defined for 3 times, just once
# setTimeout only starts execution after the loop
# is done, so the i in the closure keeps changing
# result is 3 3 3
for i in [1,2,3]
  setTimeout (-> console.log i), 0
# do means call this function immediately
for i in [1,2,3]
  do (i)->
    setTimeout (-> console.log i), 0

# even you write code after the loop
# loops are always executed in the last
# when you run the code, 32 will be in
# the middle
tribble = {count: 2}
multiply = (multiplier)->
  @count *= multiplier
multiply.call(tribble, 16)
console.log tribble.count
