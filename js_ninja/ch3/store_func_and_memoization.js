var store = {
  nextId: 1,
  // cache is an object instead of array
  cache: {},
  add: function(fn) {
    if (!fn.id) {
      fn.id = this.nextId++;
      this.cache[fn.id] = fn;
      return true;
    }
  }
};

function ninja() {}

assert(store.add(ninja),
  "Function was safely added.");
assert(!store.add(ninja),
  "But it was only added once.");

function isPrime(value) {
  if (!isPrime.answers) {
    isPrime.answers = {};
  }

  if (isPrime.answers[value] !== undefined) {
    return isPrime.answers[value];
  }

  var prime = value !== 1;

  for (i = 2; i < value; i++) {
    if (value % i === 0) {
      prime = false;
      break;
    }
  }

  isPrime.answers[value] = prime;
  return prime;
}

assert(isPrime(5), "5 is prime!");
assert(isPrime.answers[5], "The answer was cached!");

// lambda in javascript
var haha = myArg => myArg * 2;

// default params can reference previous params
function performAction(ninja, action = "skulking",
                        message = ninja + " " + action) {
  return message;
}


var ninja = (() => "Tomoe");
// samurai is undefined
var samurai = (() => {"Yoshi";});
