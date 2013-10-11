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
      var formData = $(event.currentTarget).serializeJSON();
      var restaurant = that.model;
      restaurant.set(formData.restaurant);
      restaurant.save();
      $parent.children().toggleClass("hide");
    }
  },

  editEnter: function (event) {
    if (event.keyCode != 13) { return };
    this.edit(event);
  },

  remove: function (event) {
    event.preventDefault();
    this.model.destroy( {wait: true} );
    window.location.reload();
  }

})