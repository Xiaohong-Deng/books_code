// the function adds methods to any objects
// note 'type' and 'event' seem to be interchangable

var eventuality = function (that) {
  var registry = {};

  that.fire = function (event) {
    var array,
      func,
      handler,
      i,
      type = typeof event === 'string' ?
        event: event.type;
// registry contains handlers for different types
// we want to see if there are handlers match the current type
// for the current event
    if (registry.hasOwnProperty(type)) {
      array = registry[type];
      for (i = 0; i < array.length; i += 1) {
        handler = array[i];

        func = handler.method;
// if method is a name we look up the named function on 'that' object
        if (typeof func === 'string') {
          func = this[func];
        }
// invoke the func on that anyway
        func.apply(this,
          handler.parameters || [event]);
      }
    }
    return this;
  };
// binding the event to the handler, populate the registry object
  that.on = function (type, method, parameter) {
    var handler = {
      method: method,
      parameter: parameters
    };
    if (registry.hasOwnProperty(type)) {
      registry[type].push(handler);
    } else {
      registry[type] = [handler];
    }
    return this;
  };
  return that;
};
