RedditApp.Views.Watching = Backbone.View.extend({
	events: {},
	
	template: JST["watching"],
	
	initialize: function(obj){
	  this.$rootEl = obj;
	},

	render: function(){
		var renderedContent = this.template();
		this.$rootEl.html(renderedContent);
		return this;
	}
})