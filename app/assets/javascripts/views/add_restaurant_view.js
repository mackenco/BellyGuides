BellyGuide.Views.AddRestaurantView = Backbone.View.extend({
  template: JST["restaurants/add"],
  events: {
    "click .add": "add"
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
    new_rest.set({
      map_id: parseInt(formData.map_id),
      completed: false,
      note: "",
      id: null
    })
    console.log(new_rest)
    new_rest.save();
    alert("Added!");
    Backbone.history.navigate("#/");
  }
})
