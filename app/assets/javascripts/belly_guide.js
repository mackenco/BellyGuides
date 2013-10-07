window.BellyGuide = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($rootEl, restaurants, mapID) {
    new BellyGuide.Routers.RestaurantsRouter($rootEl, restaurants);
    Backbone.history.start({ root: "/maps/"+mapID });
  }
};
