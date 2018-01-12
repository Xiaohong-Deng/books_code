// interdependent async tasks
async(function*() {
  try {
    const ninjas = yield getJSON("data/ninjas.json");
    const missions = yield getJSON(ninjas[0].missionsURL);
    const missionDescription = yield getJSON(mission[0].detailsURL);
  }
  catch(e) {
    //we didn't get the details
  }
});

function async(generator) {
  var iterator = generator();

  function handle(iteratorResult) {
    if(iteratorResult.done) {return;}

    const iteratorValue = iteratorResult.value;

    if (iteratorValue instanceof Promise) {
      // this is a async callback, so we execute it and move on immediately
      // but we only call handle() once so this async callback is the last
      // statement we execute until it is called
      // if it is a success we pass the res back to generator and create the next
      // dependent promise
      iteratorValue.then(res => handle(iterator.next(res)))
      .catch(err => iterator.throw(err));
    }
  }

  try {
    handle(iterator.next());
  }
  catch(e) {
    iterator.throw(e);
  }
}
