BellyGuide.Views.NewRestaurantView = Backbone.View.extend({
  template: JST["restaurants/new"],

  events: {
    "click input[type=submit]": "submit",
    "click .fill": "autoPopulate"
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
      {
        beforeSend: function() {
          document.body.style.cursor = 'wait';
        },
        success: function(model, response) {

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
      Backbone.history.navigate("#/");

      BellyGuide.geoJson.push(details)
      BellyGuide.markers.addLayer(L.mapbox.markerLayer(details))

      BellyGuide.map.markerLayer.setGeoJSON(BellyGuide.geoJson)
      BellyGuide.map.fitBounds(BellyGuide.markers.getBounds())

      that.collection.add(restaurant)
      },

      error: function() {
        console.log("something went wrong")
      },

      complete: function () {
        document.body.style.cursor = 'default'
      }
    });
  },

  autoPopulate: function(event) {
    console.log($(event.currentTarget).parent())
    var $form = $(event.currentTarget).parent();
    console.log($form.nth-child(1))
  }


});