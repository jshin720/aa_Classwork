console.log("Webpack is working!");

// index.js
const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

const Asteroid = require("./asteroid.js");
window.Asteroid = Asteroid;

const Game = require("./game.js");
window.Game = Game;

const GameView = require("./game_view.js");
window.GameView = GameView;


window.addEventListener('DOMContentLoaded', () => {
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext("2d");
  window.ctx = ctx;

  // const mo = new MovingObject({
  //   pos: [30, 30],
  //   vel: [10, 10],
  //   radius: 5,
  //   color: "#00FF00"
  // });
  // window.mo = mo;
  // mo.draw(ctx);

  // const ast = new Asteroid({pos:[100, 100] }); 
  // window.ast = ast;
  // ast.draw(ctx);

  // const game = new Game();
  // window.game = game;
  // game.draw();
  
  const gv = new GameView(ctx);
  window.gv = gv;
  gv.start();

});