
// moving_object.js
function MovingObject({ pos, vel, radius, color }) {
  this.pos = pos;
  this.vel = vel;
  this.radius = radius;
  this.color = color;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2, true);
  ctx.stroke();
  ctx.fillStyle = this.color;
  ctx.fill();
}

MovingObject.prototype.move = function () {
  // ctx.clearRect(0, 0, 640, 480);
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  // this.draw(ctx);
}



module.exports = MovingObject;