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
    var $form = $(event.currentTarget).parent();
    $form.children('.restaurant-name').children().val("Franklin BBQ")
    $form.children('.restaurant-source-url').children()                                   .val("http://franklinbarbecue.com/menu/")
    $form.children('.restaurant-address').children()
         .val("900 E. 11th, Austin, TX 78702")
    $form.children('.restaurant-place-type').children()
         .val("restaurant").removeAttr('selected')
   $form.children('.restaurant-type').children()
        .val("slaughterhouse").attr('selected')
    $form.children('.restaurant-note').children()
         .val("America's best BBQ restuarnat")
  }
});