BellyGuide.Views.RestaurantDetailView = Backbone.View.extend({
  template: JST["restaurants/detail"],

  events: {
    "dblclick .show": "toggle",
    "dblclick .edit": "edit"
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
    var that = this;
    $clicked_element = $(event.currentTarget);
    $parent = $clicked_element.parent();
    $parent.children().toggleClass("hide");
  },

  edit: function (event) {
    var that = this;
    $clicked_element = $(event.currentTarget);
    $parent = $clicked_element.parent();

    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    var restaurant = that.model;
    console.log(restaurant);
    console.log(restaurant.url)
    restaurant.set(formData.restaurant);
    restaurant.save();
    $parent.children().toggleClass("hide");
  }
})