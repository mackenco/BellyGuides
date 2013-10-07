BellyGuide.Views.RestaurantDetailView = Backbone.View.extend({
  render: function () {
    var that = this;

    var renderedContent = JST["restaurant/detail"]({
      restaurant: that.model
    });

    that.$el.html(renderedContent);
    return that;
  }
})