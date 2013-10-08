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
    restaurant.save();

    Backbone.history.navigate("#/");
    window.location.reload();
  }
});