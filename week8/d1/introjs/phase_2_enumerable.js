
function myEach(arr, cb){

  for (let i = 0; i < arr.length; i++) {
    cb(arr[i]);
  }
}

Array.prototype.myEach = function(cb) {
 
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}


function myMap(arr, cb) {
  let mapped = []

  mapped.push(myEach(arr, cb))


  return mapped ;
}



Array.prototype.myMap = function(cb) {
  let mapped = [];

  this.myEach(ele => mapped.push(cb(ele)));

  return mapped;
}


Array.prototype.myReduce = function(cb) {

}


