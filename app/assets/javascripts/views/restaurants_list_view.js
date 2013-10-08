BellyGuide.Views.RestaurantListView = Backbone.View.extend({
  template: JST["restaurants/list"],

  initialize: function () {
    var that = this;

    var events = ["add", "change:title", "remove", "reset"];
    _(events).each(function (event) {
      that.listenTo(that.collection, event, that.render);
    });
  },

   render: function () {
    var that = this;

    var renderedContent = this.template({
      unfinished: that.collection.where({ completed: false }),
      finished: that.collection.where({ completed: true })
    });

    that.$el.html(renderedContent);
    return that;
  }
});