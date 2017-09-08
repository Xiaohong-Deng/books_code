Boy = ->
Boy::sing = ->
  console.log "It ain't easy being a boy named Sue"
sue = new Boy()
sue.sing()

Gift = (@name)->
  Gift.count++
  @day = Gift.count
  @announce()

Gift.count = 0
Gift::announce = ->
  console.log "On day #{@day} of Christmas I received #{@name}"

gift1 = new Gift('a partridge in a pear tree')
gift2 = new Gift('two turtle doves')

class MyFirstClass
  sayHello: ->
    console.log "Hello, I'm a class!"

myFirstInstance = new MyFirstClass()
myFirstInstance.sayHello()

# 'die' is like an instance method
# @ is like self, so in 'die' it's 'this'
# which is the instance when used
# for class Tribble context @ is Tribble
# itself
class Tribble
  constructor: ->
    @isAlive = true
    Tribble.count += 1
  breed: -> new Tribble if @isAlive
  die: ->
    return unless @isAlive
    Tribble.count -= 1
    @isAlive = false
  @count: 0
  @makeTrouble: -> console.log ('Trouble' for i in [1..@count]).join(' ')

class Pet
  constructor: -> @isHungry = true
  eat: -> @isHungry = false

class Dog extends Pet
  eat: ->
    console.log "*crunch, crunch*"
    super()
  fetch: ->
    console.log 'Yip yip!'
    @isHungry = true

#polymorphism
class Shape
  constructor: (@width)->
  computeArea: -> throw new Error('I am an abstract class!')

class Square extends Shape
  computeArea: -> Math.pow @width, 2

class Circle extends Shape
  radius: -> @width / 2
  computeArea: -> Math.PI * Math.pow @radius(), 2

showArea = (shape)->
  unless shape instanceof Shape
    throw new Error('showArea requires a Shape instance!')
  console.log shape.computeArea()

showArea new Square(2)
showArea new Circle(2)

requisitionStarship = (captain)->
  switch caption
    when 'Kirk', 'Picard', 'Archer'
      new Enterprise()
    when 'Janeway'
      new voyage()
    else
      throw new Error('Invalid starship captain')
