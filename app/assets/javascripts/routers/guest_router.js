RideOrDie.Routers.GuestRouter = Backbone.Router.extend({
    initialize: function (options) {
        this.$rootEl = options.$rootEl;
    },
    routes : {
        "": "rsvp"
    },
    rsvp: function () {
        var rsvp = new RideOrDie.Models.Rsvp({id: RideOrDie.rsvpId});
        var that = this;
        rsvp.fetch({success: function () {
            var view = new RideOrDie.Views.RsvpForm({model: rsvp});
            that.$rootEl.html(view.render().$el);
        }});
    }
});