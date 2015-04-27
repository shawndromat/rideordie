RideOrDie.Routers.AppRouter = Backbone.Router.extend({
    initialize: function (options) {
        this.$rootEl = options.$rootEl;
        RideOrDie.parties = new RideOrDie.Collections.Parties();
        RideOrDie.parties.fetch();
    },
    routes: {
        "": "index",
        "party/new": "new",
        "party/:id/edit": "edit"
    },
    index: function () {
        var view = new RideOrDie.Views.PartyIndex({collection: RideOrDie.parties});
        this.swapView(view);
    },
    new: function () {
        var view = new RideOrDie.Views.PartyNew({collection: RideOrDie.parties, model: new RideOrDie.Models.Party()});
        this.swapView(view);
    },
    edit: function (id) {
        var party = RideOrDie.parties.getOrFetch(id);
        var view = new RideOrDie.Views.PartyForm({model: party});
        this.swapView(view);
    },
    swapView: function (view) {
        this._currentView && this._currentView.remove();
        this._currentView = view;
        this.$rootEl.html(view.render().$el);
    }
})