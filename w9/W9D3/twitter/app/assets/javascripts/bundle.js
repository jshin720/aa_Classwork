/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

class FollowToggle {
    
    constructor(el) {
        
        this.$el = $(el)
        console.log(this.$el)
        this.followState = this.$el.data("initial-follow-state");
        this.userID = this.$el.data("user-id");
        this.render();
        // console.log(this.$el[0])
    }

    render() {
        
        if (this.followState === 'unfollowed') {
            console.log('16')
            this.$el.text('Follow');
        } else {
            console.log('19hello')
            this.$el.text("Unfollow");
        }
    }
}


module.exports = FollowToggle;

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
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

  $(function() {
    $(".follow-toggle").each((idx, button) => new FollowToggle(button))
  });


  // console.log($(".follow-toggle"))
  
  // console.log(followButton);
// $(document).ready( function() {
  
// })

// 
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map