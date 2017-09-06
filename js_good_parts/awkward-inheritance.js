// bind the name to new object(instance of Mammal), if it's called as constructor
var Mammal = function (name) {
  this.name = name;
};
// return the new object's name, if the method gets called on the new object
Mammal.prototype.get_name = function(){
  return this.name;
};

Mammal.prototype.says = function () {
  return this.saying || '';
};

var myMammal = new Mammal('Herb the Mammal');
var name = myMammal.get_name();

console.log(name);
console.log(myMammal.says); // should say empty string

//Cat inherits from Mammal
var Cat = function (name) {
  this.name = name;
  this.saying = 'meow';
};
// connect Mammal to its instance's prototype chain
Cat.prototype = new Mammal();

Cat.prototype.purr = function (n) {
  var i, s = '';
  for (i = 0; i < n; i += 1) {
    if (s) {
      s += '-';
    }
    s += 'r';
  }
  return s;
};

Cat.prototype.get_name = function () {
  return this.says() + ' ' + this.name + ' ' + this.says();
};

var myCat = new Cat('Henrietta');
var says = myCat.says(); // 'meow'
var purr = myCat.purr(5); // 'r-r-r-r-r'
var name = myCat.get_name(); // 'meow Henrietta meow'

// to hide some ugliness
Function.method('inherits', function (Parent) {
  this.prototype = new Parent();
  // return this so we can exploit cascading like Cat.method1().method2()
  return this;
});

// recall 'method' method also return 'this' so we can use cascading to define
// Cat. Look for method definition in 'augment-types.js'
var Cat = function (name) {
  this.name = name;
  this.saying = 'meow';
}.inherits(Mammal).
  method('purr', function (n) {
    var i, s = '';
    for (i = 0; i < n; i += 1) {
      if (s) {
        s += '-';
      }
      s += 'r';
    }
    return s;
  }).
  method('get_name', function () {
    return this.says() + ' ' + this.name + ' ' + this.says();
  });
