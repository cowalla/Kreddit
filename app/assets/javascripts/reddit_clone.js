window.RedditApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
		RedditApp.router = new RedditApp.Routers.Router({
			"$rootEl": $("#sidebar-content")
		});
		console.log("STARTing");
		Backbone.history.start();
  }
};

$(RedditApp.initialize);