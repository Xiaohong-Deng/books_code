// code is self evident about how it is different for function declaration, function expression and lambda
// during the code execution
assert(typeof fun === "function",
  "fun is function even though its definition isn't raeched yet!");

assert(typeof myFunExpr === "undefined",
  "But we can not access function expressions");

assign(typeof myArrow === "undefined",
  "Nor arrow functions");

function fun() {}

var myFunExpr = function() {};
var myArrow = (x) => x;

// consider the following as a standalone js program
// first function declaration is registered
// next var fun, but not fun = 3, is scanned. it exists already
// so the value is untouched, still a function
// next execution starts, fun = 3, after the first assertion
// so all assertion pass
assert(typeof fun === "function",
  "We access the function");

var fun = 3;

assert(typeof fun === "number",
  "Now we access the number");

function fun() {};

assert(typeof fun === "number",
  "Still a number");
