BellyGuide.Views.RestaurantListView = Backbone.View.extend({
  template: JST["restaurants/list"],

  events: {
    "click .list": "detail",
    "click .detail": "removeDetail",
    "click input[type=checkbox]": "status"
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

    BellyGuide.map.setZoom(15);
    BellyGuide.map.setCenter(
       new google.maps.LatLng(restaurant.get("latitude"), restaurant.get("longitude"))
     )
   this.createMarker(id)
  },

  createMarker: function (id) {
    var rest = BellyGuide.restaurants.get(id)
    var map = BellyGuide.map

    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(rest.get("latitude"), rest.get("longitude")),
      map: BellyGuide.map,
      title: rest.get("name")
    });

    var contentString =
        '<div id="info"><h1>'+rest.get("name")+
        '</h1><p>'+rest.get("address")+'</p></div>'

    if (!map._infoWindow){
      map._infoWindow = new google.maps.InfoWindow();
    }
    map._infoWindow.close();
    map._infoWindow.setContent(contentString);
    map._infoWindow.open(map, marker);
  },

  removeDetail: function (event) {
    $(event.currentTarget).addClass("list");
    $(event.currentTarget).removeClass("detail");

    $(event.currentTarget.parentElement)
      .find('.detail-view')
      .remove();

    BellyGuide.map.setZoom(13);
    BellyGuide.map.setCenter(BellyGuide.start)
    BellyGuide.map._infoWindow.close();
  },

  status: function (event) {
    event.preventDefault();

    var id = $(event.currentTarget.parentElement).attr("data-id");
    var restaurant = BellyGuide.restaurants.get(id);
    restaurant.save({ completed: $(event.currentTarget).is(":checked") })
  }
});
