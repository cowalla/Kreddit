RedditApp.Views.Mainpage = Backbone.View.extend({
	events: {},
	
	template: JST["subreddits/showSubreddit"],
	
	initialize: function(options){
		this.links = options.links;
		this.title = "Main Page";
	},
	
	render: function(){
		var renderedContent = this.template({
			links: this.links,
			title: this.title
		});
		this.$el.html(renderedContent);
		return this;
	}
})