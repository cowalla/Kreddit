window.RedditApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
		new RedditApp.Routers.Router({
			"$rootEl": $("#content"),
		});
		Backbone.history.start();
  }
};

$(RedditApp.initialize);