Array.method('reduce', function (f, value) {
  var i;
  for (i = 0; i < this.length; i += 1) {
    value = f(this[i], value);
  }
});

var data = [4, 8, 15, 16, 23, 42];

var add = function (a, b) {
  return a + b;
};

var mult = function (a, b) {
  return a * b;
};

var sum = data.reduce(add, 1);
var product = data.reduce(mult, 1);

data.total = function () {
  return data.reduce(add, 0);
};

total = data.total();
