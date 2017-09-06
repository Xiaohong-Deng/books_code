// we encapsulate object inheritance in functions

// define a function that returns an object
var mammal = function (spec) {
  // create our new object
  var that = {};
  // augment methods of the new object
  that.get_name = function () {
    return spec.name;
  };

  that.says = function () {
    return spec.saying || '';
  };
  // return the new object
  return that;
};

// define a cat function that use mammal to
// do all the work thus achieve inheritance
var cat = function (spec) {
  spec.saying = spec.saying || 'meow';
  // create new object by call a function that returns one
  // it has 'get_name' and 'says' methods already
  var that = mammal(spec);
  that.purr = function (n) {
    var i, s ='';
    for (i = 0; i < n; i += 1) {
      if (s) {
        s += '-';
      }
      s += 'r';
    }
    return s;
  };
  that.get_name = function () {
    return that.says() + ' ' + spec.name + ' ' + that.says();
  };
  return that;
};

var myCat = cat({name: 'henrietta'});

// we save the function 'name' to 'method'
// 'name' belongs to whatever calls 'superior'
Object.method('superior', function (name) {
  var that = this,
    method = that[name];
  return function () {
    // we can return just 'method'
    // we have to do it this way if we want to call
    // 'method' on whatever calls superior
    return method.apply(that, arguments);
  };
});

var coolcat = function (spec) {
  var that = cat(spec),
    super_get_name = that.superior('get_name');
  that.get_name = function (n) {
    return 'like ' + super_get_name() + ' baby';
  };
  return that;
};

var myCoolCat = coolcat({name: 'Bix'});
var name = myCoolCat.get_name(); // 'like meow Bix meow baby'
