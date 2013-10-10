BellyGuide.Views.AddRestaurantView = Backbone.View.extend({
  template: JST["restaurants/add"],
  events: {},
  initialize: function() {},

  render: function () {
    var that = this;
    var renderedContent = this.template({
      this.model
    });

    that.$el.html(renderedContent);
    return that;
  }


})