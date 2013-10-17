BellyGuide.Views.RestaurantListView = Backbone.View.extend({
  template: JST["restaurants/list"],

  events: {
    "click .list": "detail",
    "click .detail": "removeDetail",
    "click .checkbox": "status"
  },

  initialize: function () {
    var that = this;

    var events = ["add", "change:completed", "change:name", "remove", "reset"];
    _(events).each(function (event) {
      that.listenTo(that.collection, event, that.render);
    });
  },

   render: function () {
    var that = this;
    that.collection.sort()
    var renderedContent = this.template({
      unfinished: that.collection.where({ completed: false }),
      finished: that.collection.where({ completed: true })
    });

    that.$el.html(renderedContent);
    return that;
  },

  detail: function (event) {
    var $li = $(event.currentTarget.parentElement)
    var id = $li.attr("data-id");

    var restaurant = BellyGuide.restaurants.get(id);
    var restaurantDetailView = new BellyGuide.Views.RestaurantDetailView({
      model: restaurant
    });
    $(event.currentTarget).addClass("detail")
    $(event.currentTarget).removeClass("list")

    $li.append(restaurantDetailView.render().$el)
    var pos = new L.LatLng(restaurant.get("latitude"),                                                    restaurant.get("longitude"))
    BellyGuide.map.setView(pos, BellyGuide.zoom + 1)
  },

  removeDetail: function (event) {
    $(event.currentTarget).addClass("list");
    $(event.currentTarget).removeClass("detail");

    $(event.currentTarget.parentElement)
      .find('.detail-view')
      .remove();

    BellyGuide.map.setView(BellyGuide.center, BellyGuide.zoom - 1)
  },

  status: function (event) {
    event.preventDefault();
    if (!$(event.currentTarget).hasClass("owner")) { return }

    var id = $(event.currentTarget.parentElement).attr("data-id");
    var restaurant = BellyGuide.restaurants.get(id);
    restaurant.save({ completed: $(event.currentTarget).hasClass("unfinished") })
  }
});
