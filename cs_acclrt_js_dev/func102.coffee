tribble = {count: 2}
multiply = (multiplier)->
  @count *= multiplier
multiply.call(tribble, 16)
console.log tribble.count

# in the scope where => is defined
# this is 'majorTom'
majorTome = {secondLeft: 4}
majorTom.countDown = ->
  setTimeout (=>
    console.log @secondLeft
    @secondLeft--
    if @secondLeft > 0
      @countDown()
  ), 1000
majorTom.countDown()
