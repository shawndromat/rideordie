window.RideOrDie = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    initialize: function (options) {
        if (options.role == "admin") {
            new RideOrDie.Routers.AppRouter({$rootEl: $("#content")});
        } else if (options.role == "guest") {
            new RideOrDie.Routers.GuestRouter({$rootEl: $("#content")});
        }
        Backbone.history.start();
    }
};
