BellyGuide.Views.NewRestaurantView = Backbone.View.extend({
  template: JST["restaurants/new"],

  events: {
    "click input[type=submit]": "submit"
  },

  render: function () {
    var that = this;

    var renderedContent = this.template();
    that.$el.html(renderedContent);
    return that;
  },

  submit: function (event) {
    event.preventDefault()
    var that = this;

    var formData = $(event.currentTarget.form).serializeJSON();
    var restaurant = new BellyGuide.Models.Restaurant(formData.restaurant)
    restaurant.set("map_id", BellyGuide.mapID);

    restaurant.save({wait: true},
      { success: function(model, response) {

        var details = {
              type: 'Feature',
              geometry: {
                type: 'Point',
                coordinates: [restaurant.get('longitude'),                                                    restaurant.get('latitude')]
              },
              properties: {
                title: restaurant.get('name'),
                description: restaurant.get('address'),
                'marker-size': 'medium',
                'marker-color': '#ff8079',
                'marker-symbol': restaurant.get('place_type')
              }
            }

      BellyGuide.geoJson.push(details)
      BellyGuide.markers.addLayer(L.mapbox.markerLayer(details))

      BellyGuide.map.markerLayer.setGeoJSON(BellyGuide.geoJson)
      BellyGuide.map.fitBounds(BellyGuide.markers.getBounds())

      that.collection.add(restaurant)

      Backbone.history.navigate("#/");
      }
    });
  }
});