BellyGuide.Views.RestaurantDetailView = Backbone.View.extend({
  template: JST["restaurants/detail"],

  render: function () {
    var that = this;

    var renderedContent = this.template({
      restaurant: that.model
    });

    that.$el.html(renderedContent);
    return that;
  }
})