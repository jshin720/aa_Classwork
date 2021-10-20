function uniq(arr) {
  let newArr = [];
  
  for (let i = 0; i < arr.length; i++) {
    let ele = arr[i];
    if (newArr.indexOf(ele) === -1) {
      newArr.push(ele);
    }
  }

  return newArr;
}

Array.prototype.uniq = function() {
  let newUniq = []
  
  for (let i = 0; i < this.length; i++) {
    if (newUniq.indexOf(this[i]) === -1) {
      newArr.push(this[i]);
    }
  }

  return newUniq;
  
}


function twoSum(arr) {
  let sumArr = [];

  for (let i = 0;i < arr.length; i++){
    let num1 = arr[i];
    for (let j = i + 1; j < arr.length; j++) {
      let num2 = arr[j];

      if (num1 + num2 === 0) { 
        sumArr.push([i, j])
      }
    }
  }
  return sumArr;
}

Array.prototype.twoSum = function() {
  let sumArr = [];

  for (let i = 0; i < this.length; i++) {
    let num1 = this[i];
    for (let j = i + 1; j < this.length; j++) {
      let num2 = this[j];

      if (num1 + num2 === 0) {
        sumArr.push([i, j])
      }
    }
  }
  return sumArr;


}

function transpose(arr) {
  let transposed = [];

  for (let i = 0; i < arr.length; i++) { // give me sub arrs
    let subArr = arr[i];
    let newSubArr = [];
    newSubArr.push(subArr[0]);

    for (let j = 1; j < subArr.length; j++) {
      newSubArr.push(arr[j][i])
    }
    transposed.push(newSubArr)
  }
  return transposed
}


Array.prototype.transpose = function() {
  let transposed = [];

  for (let i = 0; i < this.length; i++) { // give me sub arrs
    let subArr = this[i];
    let newSubArr = [];
    newSubArr.push(subArr[0]);

    for (let j = 1; j < subArr.length; j++) {
      newSubArr.push(subArr[j]);
    }
    transposed.push(newSubArr);
  }
  return transposed;
}