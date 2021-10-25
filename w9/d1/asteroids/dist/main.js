/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\nconst COLOR = 'orange';\nconst RADIUS = 10;\n\nUtil.inherits(Asteroid, MovingObject)\n\nfunction Asteroid({pos, game}) {\n  let rv = Util.randomVec(1);\n  MovingObject.call(this, { pos, vel: rv, radius: RADIUS, color: COLOR, game: game });\n\n  // \n  // this.color = COLOR;\n  // this.radius = RADIUS;\n  // this = new MovingObject({pos, rv, RADIUS, COLOR})\n}\n\nmodule.exports = Asteroid;\n\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nconst DIM_X = 640;\nconst DIM_Y = 480;\nconst NUM_ASTEROIDS = 20;\n\nfunction Game(){\n  this.asteroids = [];\n  this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function(){\n  for(let i = 0; i<NUM_ASTEROIDS; i++){\n    let randomPos = this.randomPosition();\n    let newAsteroid = new Asteroid({pos:randomPos, game: this});\n    this.asteroids.push(newAsteroid);\n  }\n  return this.asteroids;\n}\n\nGame.prototype.randomPosition = function(){\n  let randomPosX = Math.floor((Math.random() * DIM_X));\n  let randomPosY = Math.floor((Math.random() * DIM_Y));\n  return [randomPosX, randomPosY];\n}\n\nGame.prototype.draw = function() {\n  ctx.clearRect(0, 0, DIM_X, DIM_Y);\n  this.asteroids.forEach(asteroid => asteroid.draw(ctx));\n}\n\nGame.prototype.moveObjects = function(){\n  ctx.clearRect(0, 0, DIM_X, DIM_Y);\n  this.asteroids.forEach(asteroid => asteroid.move(ctx));\n}\n\nGame.prototype.wrap = function(pos) {\n  let x = pos[0];\n  let y = pos[1];\n  let newX;\n  let newY;\n\n  if (x < 0 ) {\n    newX = x + DIM_X;\n  } else if (x > DIM_X) {\n    newX = x - DIM_X;\n  }\n\n  if (y < 0) {\n    newY = y + DIM_Y;\n  } else if (y > DIM_Y) {\n    newY = y - DIM_Y\n  }\n  return [newX, newY];\n}\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\n\nfunction GameView(ctx){\n  this.game = new Game();\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function(){\n  let that = this;\n  setInterval(function(){\n    that.game.moveObjects();\n    that.game.draw(that.ctx);\n  }, 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\");\n\n// index.js\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nwindow.MovingObject = MovingObject;\n\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nwindow.Asteroid = Asteroid;\n\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nwindow.Game = Game;\n\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nwindow.GameView = GameView;\n\n\nwindow.addEventListener('DOMContentLoaded', () => {\n  const canvas = document.getElementById(\"game-canvas\");\n  const ctx = canvas.getContext(\"2d\");\n  window.ctx = ctx;\n\n  // const mo = new MovingObject({\n  //   pos: [30, 30],\n  //   vel: [10, 10],\n  //   radius: 5,\n  //   color: \"#00FF00\"\n  // });\n  // window.mo = mo;\n  // mo.draw(ctx);\n\n  // const ast = new Asteroid({pos:[100, 100] }); \n  // window.ast = ast;\n  // ast.draw(ctx);\n\n  // const game = new Game();\n  // window.game = game;\n  // game.draw();\n  \n  const gv = new GameView(ctx);\n  window.gv = gv;\n  gv.start();\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("\n// moving_object.js\nfunction MovingObject({ pos, vel, radius, color, game }) {\n  this.pos = pos;\n  this.vel = vel;\n  this.radius = radius;\n  this.color = color;\n  this.game = game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2, true);\n  ctx.stroke();\n  ctx.fillStyle = this.color;\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n  // ctx.clearRect(0, 0, 640, 480);\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  this.pos = this.game.wrap(this.pos);\n  // this.draw(ctx);\n}\n\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    function Surrogate(){};\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n// }\n// // Return a randomly oriented vector with the given length.\n// const Util = {\n \n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;