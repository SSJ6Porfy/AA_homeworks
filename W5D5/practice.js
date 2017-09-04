// myInject in JS
Array.prototype.myInject = function(acc = undefined, callBack) {
  let idx = 0;

  if (acc === undefined) {
    acc = this[0];
    idx++
  }

  if (callBack === undefined) {
    while (idx < this.length) {
      acc += this[idx];
      idx++
    }
  } else {
    while (idx < this.length) {
      acc = callBack(acc, this[idx]);
      idx++
    }
  }
  console.log(acc);
  return acc;
};
// use of callBacks for myInject
let factorial = function(acc, num) {
  return acc * num;
};
// use of callBacks for myInject
let onlyOdds = function(acc, num) {
  if (num % 2 === 1) {
    return acc + num;
  } else {
    return acc;
  }
};

function timer(seconds) {
  setInterval(function() {
  console.log(seconds += 1);
  },1000);
}
