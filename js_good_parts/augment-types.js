// 'this' gets bound to object when invoked, so no worries here
Function.prototype.method = function (name, func) {
  if (!this.prototype[name]) {
    this.prototype[name] = func;
    return this;
  }
};

// 'method' gets called so 'this' in the definition above
// gets bound to Number
// Number.prototype['integer'] = function () { ... }
// I guess it's the Number instance's prototype
Number.method("integer", function () {
  return Math[this < 0 ? 'ceil' : 'floor'](this);
});

// integer is Number.prototype.integer
// whe it gets called, 'this' in the function def in Number.method call
// is bound to (-10 / 3)
console.log((-10 / 3).integer());

String.method("trim", function () {
  return this.replace(/^\s+|\s+$/g, '');
});

console.log('"' + "   neat   ".trim() + '"');
