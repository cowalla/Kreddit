RedditApp.Views.NewPost = Backbone.View.extend({
	events: {},
	
	template: JST["newpost"],
	
	initialize: function(obj){
	  this.$rootEl = obj;
	},
	
	render: function(){
		var renderedContent = this.template({});
		this.$rootEl.html(renderedContent);
		return this;
	}
})