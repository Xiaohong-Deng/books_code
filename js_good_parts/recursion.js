var walk_the_DOM = function walk(node, func) {
  func(node);
  node = node.firstChild;
  while (node) {
    walk(node, func);
    node = node.nextSibling;
  }
};

var getElementByAttribute = function (att, value) {
  var result = [];

  walk_the_DOM(document.body, function (node) {
    // && produce the actual value of either expression instead of true or false
    var actual = node.nodeType === 1 && node.getAttribute(att);
    // collect the value if attribute is located and matches the value or value given is not a string
    if (typeof actual === 'string' && (
        actual === value || typeof value !== 'string')) {
      results.push(node);
    }
  });
};
