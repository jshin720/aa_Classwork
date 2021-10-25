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
    let newAsteroid = new Asteroid({pos:randomPos, game: this});
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

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];
  let newX;
  let newY;

  if (x < 0 ) {
    newX = x + DIM_X;
  } else if (x > DIM_X) {
    newX = x - DIM_X;
  }

  if (y < 0) {
    newY = y + DIM_Y;
  } else if (y > DIM_Y) {
    newY = y - DIM_Y
  }
  return [newX, newY];
}
module.exports = Game;