// Recorder is a javascript class that wraps around the TokBox API.
function Recorder (options) {
  this.playerId = options["playerId"];
  this.recorderId = options["recorderId"]
  this.debugging = options["debug"];

  // Verbose logging from TokBox JS API
  if (this.debugging) TB.setLogLevel(TB.DEBUG);

  this.width = options["width"] || 518;
  this.height = options["height"] || 388;

  this.apiConfig = {
    apiKey: options["apiKey"],
    apiToken: options["apiToken"],
    sessionId: options["sessionId"]
  };

  this.recorder = null;
  this.player = null;

  this.recorderManager = TB.initRecorderManager(this.apiConfig.apiKey);
};

// Utility methods
Recorder.prototype.debug = function () {
  if (this.debugging && typeof(console) !== "undefined") {
    console.log.apply(console, arguments);
  }
};

// Recorder Events
Recorder.prototype.onRecordingStarted = function (event) {
  this.debug("onRecordingStarted", event);
  $("#" + this.recorderId).trigger("opentok.recordingStarted");
};

Recorder.prototype.onRecordingStopped = function (event) {
  this.debug("onRecordingStopped", event);
  $("#" + this.recorderId).trigger("opentok.recordingStopped");
};

Recorder.prototype.onArchiveSaved = function (archiveEvent) {
  this.debug("onArchiveSaved", archiveEvent);
  this.archive = archiveEvent.archives[0].archiveId;

  this.hideRecorder();
  this.showPlayer();

  $("#" + this.recorderId).trigger("opentok.archiveSaved");
};

// Player events
Recorder.prototype.onArchiveLoaded = function (event) {
  this.debug("onArchiveLoaded", event);
  $("#" + this.playerId).trigger("opentok.archiveLoaded");
};

Recorder.prototype.onPlaybackStarted = function (event) {
  this.debug("onPlaybackStarted", event);
  $("#" + this.playerId).trigger("opentok.playbackStarted");
};

Recorder.prototype.onPlaybackPaused = function (event) {
  this.debug("onPlaybackPaused", event);
  $("#" + this.playerId).trigger("opentok.playbackPaused");
};

Recorder.prototype.onPlaybackStopped = function (event) {
  this.debug("onPlaybackStopped", event);
  $("#" + this.playerId).trigger("opentok.playbackStopped");
};

// Interface
Recorder.prototype.record = function () {
  if (this.recorder !== null) this.recorder.startRecording();
};

Recorder.prototype.showRecorder = function () {
  this.recorder = this.recorderManager.displayRecorder(this.apiConfig.apiToken, this.recorderId, {
    width: this.width,
    height: this.height
  });

  this.recorder.removeEventListener("recordingStarted", _.bind(this.onRecordingStarted, this))
  this.recorder.addEventListener("recordingStarted", _.bind(this.onRecordingStarted, this));

  this.recorder.removeEventListener("recordingStopped", _.bind(this.onRecordingStopped, this));
  this.recorder.addEventListener("recordingStopped", _.bind(this.onRecordingStopped, this));

  this.recorder.removeEventListener("archiveSaved", _.bind(this.onArchiveSaved, this));
  this.recorder.addEventListener("archiveSaved", _.bind(this.onArchiveSaved, this));
};

Recorder.prototype.hideRecorder = function () {
  this.recorderManager.removeRecorder(this.recorder);
};

Recorder.prototype.showPlayer = function () {
  this.player = this.recorderManager.displayPlayer(this.archive, this.apiConfig.apiToken, this.playerId, {
    width: this.width,
    height: this.height
  });


};

Recorder.prototype.hidePlayer = function () {
  this.recorderManager.removePlayer(this.player);
};

// On script load
var video = new Recorder({
  debug: true,
  recorderId: "recorder",
  playerId: "player",
  apiKey: liveSign.config.for("opentok_api_key"),
  apiToken: liveSign.config.for("opentok_auth_token"),
  sessionId: liveSign.config.for("opentok_session_id")
});

// On DOM ready
$(function () {
  video.showRecorder();

  $("#" + video.recorderId).click(function () {
    if (video.recorder === null) return;

    if ($(this).hasClass("recording")) {
      video.recorder.stopRecording();
    } else {
      video.recorder.startRecording()
    }
  });

  $("#" + video.playerId).click(function () {
    if (video.player === null) return;

    if ($(this).hasClass("playing")) {
      video.player.pause();
    } else {
      video.player.play();
    }
  });
});