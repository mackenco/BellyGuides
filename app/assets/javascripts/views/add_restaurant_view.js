BellyGuide.Views.AddRestaurantView = Backbone.View.extend({
  template: JST["restaurants/add"],
  events: {
    "click input[type=submit]": "add"
  },

  initialize: function() {},

  render: function () {
    var that = this;
    var renderedContent = this.template({
      maps: BellyGuide.current_maps,
      restaurant: this.model
    });

    that.$el.html(renderedContent);
    return that;
  },


  add: function (event) {
    event.preventDefault();
    var new_rest = this.model.clone()
    var formData = $(event.currentTarget.form).serializeJSON()
    new_rest.set({map_id: parseInt(formData.map_id), completed: false, note: ""})
    new_rest.save();
    alert("Added!");
    Backbone.history.navigate("#/");
  }

})


// addRestaurant: function (event) {
//   event.preventDefault();
//   var $li = $(event.currentTarget.parentElement)
//   var id = $li.attr("data-id");
//
//   var restaurant = BellyGuide.restaurants.get(id);
//   var addRestaurantView = new BellyGuide.Views.AddRestaurantView({
//     model: restaurant
//   });
//
//   $li.html(addRestaurantView.render().$el)
// }