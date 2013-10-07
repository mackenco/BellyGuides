BellyGuide.Views.RestaurantListView = Backbone.View.extend({
   render: function () {
    var that = this;

    var renderedContent = JST["restaurants/list"]({
      restaurants: that.collection
    });

    that.$el.html(renderedContent);
    return that;
  },

  showRestaurant: function (event) {
    console.log("I was clicked")
  }
});