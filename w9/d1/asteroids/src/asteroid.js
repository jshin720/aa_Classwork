const MovingObject = require("./moving_object");
const Util = require("./util");

const COLOR = 'orange';
const RADIUS = 10;

Util.inherits(Asteroid, MovingObject)

function Asteroid({pos, game}) {
  let rv = Util.randomVec(1);
  MovingObject.call(this, { pos, vel: rv, radius: RADIUS, color: COLOR, game: game });

  // 
  // this.color = COLOR;
  // this.radius = RADIUS;
  // this = new MovingObject({pos, rv, RADIUS, COLOR})
}

module.exports = Asteroid;

