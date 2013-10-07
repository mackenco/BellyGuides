BellyGuide.Routers.RestaurantsRouter = Backbone.Router.extend({
  initialize: function ($rootEl, restaurants) {
    this.$rootEl = $rootEl;
    this.restaurants = restaurants;
  },

  routes: {
    "": "index",
    "restaurants/:id": "show"
  },

  index: function () {
    var that = this;

    var restaurantsListView = new BellyGuide.Views.RestaurantListView({
      collection: that.restaurants
    });

    that.$rootEl.html(restaurantsListView.render().$el);
  },

  show: function (id) {

  }
});