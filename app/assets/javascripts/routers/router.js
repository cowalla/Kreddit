RedditApp.Routers.Router = Backbone.Router.extend({
	
	initialize: function (options) {
		this.$rootEl = options.$rootEl;
		console.log("router initialized");
	},
	
	newPost: function (obj) {
	  console.log("I was called")
	  var view = new RedditApp.Views.NewPost(obj);
	  this._swapView(view);
	},
	
	watching: function (obj) {
	  var view = new RedditApp.Views.Watching(obj);
	  this._swapView(view);
	},

	_swapView: function (view){
		this._currentView && this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(view.render().$el);
	}
	
})