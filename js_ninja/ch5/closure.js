var outerValue = "samurai";
var later;

function outerFunction() {
  var innerValue = "ninja";

  function innerFunction() {
    assert(outerValue === "samurai", "I can see the samuria.");
    assert(innerValue === "ninja", "I can see the ninja.");
  }

  later = innerFunction;
}

// execute the asserts
outerFunction();
// call innerFunction whose scope has gone away at this point
later();

function Ninja() {
  var feints = 0;

  this.getFeints = function() {
    return feints;
  };

  this.feint = function() {
    feints++;
  };
}
// once Ninja gets called, all code in its definition gets executed once
// in detail, first a lexical environment is created, var feint is registered
// then nothing more needs to be registered so execution begins
// two functions are defined through function expression, they both set their
// own [[Environment]] to the lexical environment they are created, Ninja environment
var ninja1 = new Ninja();
ninja1.feint();

assert(ninja1.feints === undefined,
  "And the private data is inaccessible to us.");
assert(ninja1.getFeints() === 1,
  "We are able to access the internal feint count.");

// Ninja definition gets executed again so var feints is 0 again
// the following two methods are assigned again to different properties
// Here Ninja is called again so the creation of lexical environment starts all over again
var ninja2 = new Ninja();
assert(ninja2.getFeints === 0,
  "The second ninja object gets its own feints variable.");
