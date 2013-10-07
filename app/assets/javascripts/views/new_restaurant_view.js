BellyGuide.Views.NewRestaurantView = Backbone.View.extend({
  template: JST["restaurants/new"],

  events: {
    "click button.submit": "submit"
  },

  render: function () {
    var that = this;

    var renderedContent = this.template();
    that.$el.html(renderedContent);
    return that;
  },

  submit: function () {
    var that = this;

    var formData = $(event.currentTarget).serializeJSON();
    var restaurant = new BellyGuide.Models.Restaurant(formData.restaurant);

    that.collection.add(restaurant);
    restaurant.save();
    Backbone.history.navigate("#/");
  }
});