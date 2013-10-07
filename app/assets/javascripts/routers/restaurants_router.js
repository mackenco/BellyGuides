BellyGuide.Routers.RestaurantsRouter = Backbone.Router.extend({
  initialize: function ($rootEl, restaurants) {
    this.$rootEl = $rootEl;
    this.restaurants = restaurants;
  },

  routes: {
    "": "index",
    "restaurants/new": "new",
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
    var that = this;

    var restaurant = that.restaurants.get(id);
    var restaurantDetailView = new BellyGuide.Views.RestaurantDetailView({
      model: restaurant
    });

    that.$rootEl.html(restaurantDetailView.render().$el)
  },

  new: function () {
    var that = this;

    var newRestaurantView = new BellyGuide.Views.NewRestaurantView({
      collection: that.restaurants
    });

    that.$rootEl.html(newRestaurantView.render().$el);
  }
});