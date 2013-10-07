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

  }
});