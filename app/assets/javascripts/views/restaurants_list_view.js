BellyGuide.Views.RestaurantListView = Backbone.View.extend({
  template: JST["restaurants/list"],

  events: {
    "click .restaurant": "detail"
  },

  initialize: function () {
    var that = this;

    var events = ["add", "change", "remove", "reset"];
    _(events).each(function (event) {
      that.listenTo(that.collection, event, that.render);
    });
  },

   render: function () {
    var that = this;

    var renderedContent = this.template({
      unfinished: that.collection.where({ completed: false }),
      finished: that.collection.where({ completed: true })
    });

    that.$el.html(renderedContent);
    return that;
  },


  detail: function (event) {
    var id = $(event.currentTarget).attr("data-id");
    var restaurant = BellyGuide.restaurants.get(id);
    var restaurantDetailView = new BellyGuide.Views.RestaurantDetailView({
      model: restaurant
    });
    var $li = $(event.currentTarget)
    $li.append(restaurantDetailView.render().$el)
  }
});
