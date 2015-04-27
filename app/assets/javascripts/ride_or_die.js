window.RideOrDie = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
      new RideOrDie.Routers.AppRouter({$rootEl: $("#content")});
      Backbone.history.start();
  }
};
