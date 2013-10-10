BellyGuide.Routers.RestaurantsRouter = Backbone.Router.extend({
  initialize: function ($rootEl) {
    this.$rootEl = $rootEl;
  },

  routes: {
    "": "index",
    "restaurants/new": "new",
    "restaurants/:id/add": "addRestaurant"
  },

  index: function () {
    var that = this;
    var restaurantsListView = new BellyGuide.Views.RestaurantListView({
      collection: BellyGuide.restaurants
    });

    that._swapView(restaurantsListView)
  },

  new: function () {
    var that = this;

    var newRestaurantView = new BellyGuide.Views.NewRestaurantView({
      collection: BellyGuide.restaurants
    });

    that._swapView(newRestaurantView)
  },

  addRestaurant: function (id) {

    var addRestaurantView = new BellyGuide.Views.AddRestaurantView({
      model: BellyGuide.restaurants.get(parseInt(id))
    });

    this._swapView(addRestaurantView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});