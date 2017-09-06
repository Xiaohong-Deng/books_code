var memoizer = function (memo, formula) {
  var recur = function (n) {
    var result = memo[n];
    if (typeof result !== 'number') {
      result = formula(recur, n);
      memo[n] = result;
    }
    return result;
  };
  return recur;
};

// formula calls recur again and formula gets called many times
// memo gets updated many times, this behavior applies to python
// and ruby

var fibonacci = memoizer([0, 1], function (recur, n) {
  return recur(n - 1) + recur(n - 2);
});

var factorial = memoizer([1, 1], function (recur, n) {
  return n * recur(n - 1);
});
