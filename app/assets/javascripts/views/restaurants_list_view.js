BellyGuide.Views.RestaurantListView = Backbone.View.extend({
  template: JST["restaurants/list"],

   render: function () {
    var that = this;

    var renderedContent = this.template({
      restaurants: that.collection
    });

    that.$el.html(renderedContent);
    return that;
  },

  showRestaurant: function (event) {
    console.log("I was clicked")
  }
});