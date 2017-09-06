var add = function (a, b) {
  return a + b;
};

// this definition won't work
Function.method('curry', function () {
  // arguments is a special array like variable
  // it contains all the arguments provided to function
  var args = arguments, that = this;
  return function () {
    // apply() is like call except the sencond argument
    // is the arguments provided to the function
    // the first one is 'this' for the function
    return that.apply(null, args.concat(arguments));
  };
});

Function.method('curry', function () {
  var slice = Array.prototype.slice,
      // arugments here is 'this', no arguments needed, so omitted
      args = slice.apply(arguments),
      that = this;
  return function () {
    return that.apply(null, args.concat(slice.apply(arguments)));
  };
});

var add1 = add.curry(1);
console.log(add1(6));
