window.BellyGuide = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($rootEl, restaurantData, mapID) {
    var restaurants = new BellyGuide.Collections.Restaurants(restaurantData)

    new BellyGuide.Routers.RestaurantsRouter($rootEl, restaurants);
    Backbone.history.start({ root: "/maps/"+mapID });
  }
};
