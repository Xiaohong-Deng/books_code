function getJSON(url) {
  return new Promise((resolve, reject) => {
    const request = new new XMLHttpRequest();

    request.open("GET", url);

    request.onload = function() {
      try {
        if (this.status === 200) {
          resolve(JSON.parse(this.response));
        } else {
          reject(this.status + " " + this.statusText);
        }
      } catch(e) {
        reject(e.message);
      }
    };

    request.onerror = function() {
      reject(this.status + " " + this.statusText);
    };
    // is request.send a background running thread?
    // so we dont have to wait until it's finished
    // such that Promise can be a pending object for
    // a while
    request.send();
  });
}

getJSON("data/ninjas.json").then(ninjas => {
  assert(ninjas !== null, "Ninja obtained!");
}).catch(e => fail("Shouldn't be here:" + e));

Promise.all([getJSON("data/ninjas.json"),
            getJSON("data/mapInfo.json"),
            getJSON("data/plan.json")]).then(results => {
              const ninjas = results[0], mapInfo = results[1], plan = results[2];

              assert(ninjas !== undefined && mapInfo !== undefined && plan !== undefined,
                "The plan is ready to be set in motion!");
            }).catch(error => {
              fail("A problem in carrying out our plan!");
            });
