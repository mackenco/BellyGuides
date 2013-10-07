window.BellyGuide = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($rootEl, restaurantData, mapID) {
    BellyGuide.restaurants = new BellyGuide.Collections.Restaurants(restaurantData)
    BellyGuide.mapID = mapID;

    new BellyGuide.Routers.RestaurantsRouter($rootEl);
    Backbone.history.start();
  }
};
