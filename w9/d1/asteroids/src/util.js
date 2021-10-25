const Util = {
  inherits(childClass, parentClass) {
    function Surrogate(){};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass
  }
};

module.exports = Util;