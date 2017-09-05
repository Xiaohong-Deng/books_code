// define a function that sets a DOM node's color
// to yellow and then fades it to white
var fade = function (node) {
  var level = 1;
  var step = function () {
    var hex = level.toString(16);
    node.style.background = '#FFFF' + hex + hex;
    if (level < 15) {
      level += 1;
      setTimeout(step, 100);
    }
  };
  setTimeout(step, 100);
};

fade(document.body);

// setTimeout() will set the time for step to run and end immediately
// so step function will be called many times after fade() returns
// the inner function not only can access the var in the scope but also
// it can change it and the changed effect carries over to the next call
// of step
