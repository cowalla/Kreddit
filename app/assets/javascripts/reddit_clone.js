window.RedditApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
		RedditApp.links = new RedditApp.Collections.Links();
		RedditApp.links.fetch();
		new RedditApp.Routers.Router({
			"$rootEl": $("#content"),
			links: RedditApp.links
		});
		Backbone.history.start();
  }
};

$(RedditApp.initialize);