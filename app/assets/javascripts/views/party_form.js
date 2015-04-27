RideOrDie.Views.PartyForm = Backbone.View.extend({
    initialize: function () {
        this.listenTo(this.model, 'sync', this.render);
    },
    events: {
        "submit form": "submit"
    },
    template: JST["party_form"],
    render: function () {
        var content = this.template({party: this.model});
        this.$el.html(content);
        this.attachGuestRows();
        return this;
    },
    attachGuestRows: function () {
        var $guestsRow = this.$('.guests');
        $guestsRow.empty();
        var that = this;
        this.model.guests().each(function(guest, index) {
            var view = new RideOrDie.Views.GuestRow({model: guest, index: index, party: that.model});
            $guestsRow.append(view.render().$el);
        });
    },
    submit: function (event) {
        event.preventDefault();
        Backbone.history.navigate("/", {trigger: true});
    }
})