position = if offScreen then 'absolute' else 'relative'
$el.css {position}

sprite?.coordinates
sprite?.opacity = 1
console?.log?('better safe than sorry')

{x, y} = coordinates

fire = ({x, y})->
  if x is 5 and y is 7
    console.log 'you sunk my battleship!'

# subscript in the bracket will get converted to
# string by sub.toString so these two are equal
arr[{toString: -> '1'}]
arr[1]

class Person
  constructor: (options)->
    {@name, @age, @height = 'average'} = options
tim = new Person name: 'Tim', age: 4

# iterate through properties that are not
# inherited from prototype
for own property of tim
  console.log tim[property]

negativeNumbers = for num in [1, 2, 3, 4]
  -num

primeReciprocals = for num in [1, 2, 3, 4] when isPrime(num)
  1 / num

keyPressed = while(char = handleKeyPress())
  char
# cs compiler only generates comprehensions when the array value
# is used, to avoid being used, add empty return in the end
# then no new array generated thus a performance gain
moveFlyingToasters = (toasters)->
  for toaster in toasters
    toaster.x += 1
    toaster.y += 1
  return
