RideOrDie.Views.RsvpForm = Backbone.View.extend({
    template: JST["rsvp_form"],
    render: function () {
        var content = this.template({rsvp: this.model});
        this.$el.html(content);
        this.attachGuestRows();
        return this;
    },
    attachGuestRows: function () {
        var $guestsRow = this.$('.guests');
        $guestsRow.empty();
        var that = this;
        this.model.guestRsvps().each(function(guestRsvp) {
            var view = new RideOrDie.Views.GuestRsvpRow({model: guestRsvp, rsvp: that.model});
            $guestsRow.append(view.render().$el);
        });
    },
});
