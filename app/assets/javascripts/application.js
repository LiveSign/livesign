//= require jquery
//= require jquery_ujs
//= require jquery.mobile
//= require config

// Initialize window.liveSign namespace and initialize liveSign.config
(function (namespace) {
  var root = this;

  root[namespace] = root[namespace] || {};
  root[namespace].config = new Config(root.config);

}).call(this, "liveSign");