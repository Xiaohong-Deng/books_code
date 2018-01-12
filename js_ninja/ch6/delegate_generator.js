function* WarriorGen() {
  yield "Sun Tzu";
  // delegate next() to NinjaGen until it is exhuasted
  yield* NinjaGen();
  yield "Genghis Khan";
}

function* NinjaGen() {
  yield "Hattori";
  yield "Yoshi";
}

for(let warrior of WarriorGen()) {
  assert(warrior !== null, warrior);
}
