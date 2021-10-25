// function sum() {
//   let sum = 0;

//   for (let i = 0; i < arguments.length; i++) {
//     sum += arguments[i];
//   }
//   return sum; 
// }

// function sum(...nums) {
//   let sum = 0;

//   for (let i = 0; i < nums.length; i++) {
//     sum += nums[i];
//   }
//   return sum; 
// }


// console.log(sum(1, 2, 3, 4)) //=== 10
// console.log(sum(1, 2, 3, 4, 5)) // === 15

Function.prototype.myBind = function (ctx) {
  let func = this;
  let arrgs = Array.from(arguments).slice(1);
  return function () {
    return func.apply(ctx, arrgs);
  }
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true



