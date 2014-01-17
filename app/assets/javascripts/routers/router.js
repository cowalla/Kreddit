RedditApp.Routers.Router = Backbone.Router.extend({
	
	initialize: function (options) {
		this.$rootEl = options.$rootEl;
	},

	// routes: {
	// 	'': "mainpage",
	// 	"r/:id": "subredditsShow"
	// },
	
	mainpage: function(){
		var that = this;
		var links = this.links;
		this.$rootEl.html('')
		var mainpageView = new RedditApp.Views.Mainpage({
			collection: links
		});
		this._swapView(mainpageView);
		links.each(function(link){
			var linkDetailView = new RedditApp.Views.LinkDetail({
				model: link
			});
			that.$rootEl.append(linkDetailView.render().$el);
		});
		return that;
	},
	
	subredditsShow: function(){
		
	},
	
	_swapView: function (view){
		this._currentView && this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(view.render().$el);
	}
	
})