myGlobalShould = {
  exist: function() {
    return require("should").exist
  },
  not: function() {
    return function(obj, msg){
      return require("should").not
    };
  }
}

myGlobalShould.not.exist = function() {
  return function(obj, msg){
    return require("should").not.exist
  };
}

global.should = myGlobalShould
global.log = require('../src/middleware/logger/log');