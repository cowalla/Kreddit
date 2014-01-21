window.RedditApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
		new RedditApp.Routers.Router({
			"$rootEl": $("#sidebar-content"),
		});
		Backbone.history.start();
  }
};

$(RedditApp.initialize);