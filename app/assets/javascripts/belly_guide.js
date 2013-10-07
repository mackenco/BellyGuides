window.BellyGuide = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($rootEl, restaurants) {
    new BellyGuide.Routers.RestaurantsRouter($rootEl, restaurants);
    Backbone.history.start();
  }
};
