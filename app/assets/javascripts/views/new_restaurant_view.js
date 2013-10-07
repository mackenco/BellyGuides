BellyGuide.Views.NewRestaurantView = Backbone.View.extend({
  events: {
    "click button.submit": "submit"
  },

  render: function () {
    var that = this;

    var renderedContent = JST["restaurants/new"]();
    that.$el.html(renderedContent);
    return that;
  },

  submit: function () {
    var that = this;

    var formData = $(event.currentTarget).serializeJSON();
    var task = new BellyGuide.Models.Restaurant(formData.restaurant);

    that.collection.add(task);
    Backbone.history.navigate("#/");
  }
});