window.BellyGuide = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($rootEl, restaurantData, mapData, mapID, owner) {
    BellyGuide.restaurants = new BellyGuide.Collections.Restaurants(restaurantData)

    BellyGuide.current_maps = new BellyGuide.Collections.Maps(mapData)
    BellyGuide.mapID = mapID;
    BellyGuide.owner = owner;
    new BellyGuide.Routers.RestaurantsRouter($rootEl);
    Backbone.history.start();
  }
};
