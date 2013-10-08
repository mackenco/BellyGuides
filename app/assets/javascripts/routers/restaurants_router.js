BellyGuide.Routers.RestaurantsRouter = Backbone.Router.extend({
  initialize: function ($rootEl) {
    this.$rootEl = $rootEl;
  },

  routes: {
    "": "index",
    "restaurants/new": "new",
    "restaurants/:id": "show"
  },

  index: function () {
    var that = this;
    var restaurantsListView = new BellyGuide.Views.RestaurantListView({
      collection: BellyGuide.restaurants
    });

    that._swapView(restaurantsListView)
  },

  show: function (id) {
    var that = this;

    var restaurant = BellyGuide.restaurants.get(id);
    var restaurantDetailView = new BellyGuide.Views.RestaurantDetailView({
      model: restaurant
    });

    var $li = that.$rootEl.find("[data-id="+id+"]")
    $li.append(restaurantDetailView.render().$el)
  },

  new: function () {
    var that = this;

    var newRestaurantView = new BellyGuide.Views.NewRestaurantView({
      collection: BellyGuide.restaurants
    });

    that._swapView(newRestaurantView)
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});