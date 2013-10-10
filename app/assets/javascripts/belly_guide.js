window.BellyGuide = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($rootEl, restaurantData, mapID, owner) {
    BellyGuide.restaurants = new BellyGuide.Collections.Restaurants(restaurantData)
    BellyGuide.mapID = mapID;
    BellyGuide.owner = owner;
    new BellyGuide.Routers.RestaurantsRouter($rootEl);
    Backbone.history.start();
  }
};
