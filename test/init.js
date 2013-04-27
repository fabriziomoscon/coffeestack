/*
  After requiring `should,js` it is impossible to add a var called `should` to the global namespace.
  This workaround makes should available in all test files
*/

should = {
  exist: function() {
    return require("should").exist
  },
  not: function() {
    return function(obj, msg){
      return require("should").not
    };
  }
}

should.not.exist = function() {
  return function(obj, msg){
    return require("should").not.exist
  };
}

global.should = should
global.log = require('../src/middleware/logger/log');