BellyGuide.Views.RestaurantDetailView = Backbone.View.extend({
  template: JST["restaurants/detail"],

  events: {
    "dblclick .show": "toggle",
    "dblclick .edit": "edit",
    "keypress .edit": "editEnter",
    "click .delete": "remove",
    "click .add": "addRestaurant"
  },

  initialize: function () {
    var that = this;
    var renderCallback = that.render.bind(that);
    that.listenTo(that.model, 'change', renderCallback);
  },

  render: function () {
    var that = this;
    var renderedContent = this.template({
      restaurant: that.model
    });

    that.$el.html(renderedContent);
    return that;
  },

  toggle: function (event) {
    if (BellyGuide.owner) {
      var that = this;
      $clicked_element = $(event.currentTarget);
      $parent = $clicked_element.parent();
      $parent.children().toggleClass("hide");
    }
  },

  edit: function (event) {
    if (BellyGuide.owner) {
      var that = this;
      $clicked_element = $(event.currentTarget);
      $parent = $clicked_element.parent();

      event.preventDefault();
      console.log($(event.currentTarget))
      var formData = $(event.currentTarget).serializeJSON();
      var restaurant = that.model;
      restaurant.set(formData.restaurant);
      restaurant.save();
      $parent.children().toggleClass("hide");
    }
  },

  editEnter: function (event) {
    if (event.keyCode != 13) { return };
    event.preventDefault();
    this.edit(event);
  },

  remove: function (event) {
    event.preventDefault();
    var that = this;
    var foundIndex = null;

    BellyGuide.markers.clearLayers()

    BellyGuide.geoJson.forEach(function(obj) {
      var coords = [that.model.get('longitude'), that.model.get('latitude')]
      if(obj.geometry.coordinates[0] == coords[0] &&                                     obj.geometry.coordinates[1] == coords[1]) {
        foundIndex = _.indexOf(BellyGuide.geoJson, obj)
      } else {
        BellyGuide.markers.addLayer(L.mapbox.markerLayer(obj))
      }
    })

    BellyGuide.geoJson.splice(foundIndex, 1)

    BellyGuide.map.markerLayer.setGeoJSON(BellyGuide.geoJson)
    BellyGuide.map.fitBounds(BellyGuide.markers.getBounds()).zoomOut();

    this.collection.remove(this.model)
    this.model.destroy( {wait: true} );
  }

})