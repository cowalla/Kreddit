RedditApp.Views.LinkDetail = Backbone.View.extend({
	initialize: function(options){
		this.model = options.model
	},
	
	template: JST["links/detail"],
	
	events: {},
	
	render: function(){
		this.$el.html(this.template({
			link: this.model 
		}))
		return this;
	},
})