// Config
//
// Takes a JSON string and creates getters to provide a read-only
// store of keys and values.
var Config = function (configuration) {
  if(typeof(configuration) === "string") {
    this.__config = JSON.parse(json_string);
  } else {
    this.__config = {};
  }
};

Config.prototype = {

  // Return an array containing all available configuration keys.
  keys: function () {
    keys = [];

    for(var key in this.__config) {
      keys.push(key);
    };

    // Return cache of keys on consequent invocations
    this.keys = function () { return keys; };

    return keys;
  },

  // Returns the value for a given key.
  for: function (key) {
    return this.__config[key];
  }
};