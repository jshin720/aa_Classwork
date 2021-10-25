const Asteroid = require("./asteroid");

const DIM_X = 640;
const DIM_Y = 480;
const NUM_ASTEROIDS = 20;

function Game(){
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function(){
  for(let i = 0; i<NUM_ASTEROIDS; i++){
    let randomPos = this.randomPosition();
    let newAsteroid = new Asteroid({pos:randomPos});
    this.asteroids.push(newAsteroid);
  }
  return this.asteroids;
}

Game.prototype.randomPosition = function(){
  let randomPosX = Math.floor((Math.random() * DIM_X));
  let randomPosY = Math.floor((Math.random() * DIM_Y));
  return [randomPosX, randomPosY];
}

Game.prototype.draw = function() {
  ctx.clearRect(0, 0, DIM_X, DIM_Y);
  this.asteroids.forEach(asteroid => asteroid.draw(ctx));
}

Game.prototype.moveObjects = function(){
  ctx.clearRect(0, 0, DIM_X, DIM_Y);
  this.asteroids.forEach(asteroid => asteroid.move(ctx));
}

module.exports = Game;