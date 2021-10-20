function bubbleSort(arr) {
  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (let i = 0; i < arr.length; i++) {
      if (arr[i] > arr[i + 1]) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];

        sorted = false;
      }
    }
  }


  return arr;
}


Array.prototype.bubbleSort = function() {
  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (let i = 0; i < this.length; i++) {
      if (this[i] > this[i + 1]) {
        [this[i], this[i + 1]] = [this[i + 1], this[i]];

        sorted = false;
      }
    }
  }


  return this;
}

function subString(str){
  let subs = [];

  for (let i = 0; i < str.length; i++){

    for (let j = i; j < str.length; j++){
      subs.push(str.slice(i, j));
    }
  }
  return subs;
}

String.prototype.substrings = function() {
  let subs = [];

  for (let i = 0; i < this.length; i++) {

    for (let j = i; j < this.length; j++) {
      subs.push(this.slice(i, j));
    }
  }
  return subs;
}