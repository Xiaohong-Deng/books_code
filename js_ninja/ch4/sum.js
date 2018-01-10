function sum(...numbers) {
  return numbers.reduce((a, b) => a + b, 0);
}

function Ninja() {
  // as a method "return this;" will return "this" within Ninja function, that is this in "this.skulk"
  this.skulk = function() {
    return this;
  };
}

// when invoked as constructor, this for Ninja is the object the invocation created
// after it is created, it is assigned to ninja1 and ninja2
// so ninja1 and ninja2 have "skulk" property
var ninja1 = new Ninja();
var ninja2 = new Ninja();

assert(ninja1.skulk() === ninja1,
  "The first ninja is skulking");
assert(ninja2.skulk() === ninja2,
  "The second ninja is skulking");

function forEach(list, callback) {
  for (var n = 0; n < list.length; n++) {
    callback.call(list[n], n);
  }
}

var weapons = [ {type: "shuriken"},
                {type: "katana"},
                {type: "nonchucks"} ];

forEach(weapons, function(index) {
  assert(this === weapons[index],
    "Got the expected value of " + weapons[index].type);
});
