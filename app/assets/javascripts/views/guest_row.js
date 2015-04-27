RideOrDie.Views.GuestRow = Backbone.View.extend({
    initialize: function (options) {
        this.index = options.index;
        this.party = options.party;
    },
    className: "row guest",
    events: {
        "click .plus-one": "togglePlusOne",
        "blur .name-input": "saveGuest"
    },
    template: JST["guest_row"],
    render: function () {
        var content = this.template({guest: this.model, index: this.index});
        this.$el.html(content);
        return this;
    },
    togglePlusOne: function (event) {
        var $checkBox = $(event.currentTarget);
        var $input = this.$('.name-input');
        if (!$checkBox.prop('checked')) {
            $input.prop('disabled', false);
            $input.prop('placeholder', 'Guest Name');
        } else {
            $input.prop('disabled', true);
            $input.val("");
            $input.prop("placeholder", "Plus one");
        }
    },
    saveGuest: function (event) {
        var name = $(event.currentTarget).val();
        var that = this;
        this.model.save({
            "name": name,
            "party_id": this.party.id
        }, {
            success: function () {
                console.log(that.model);
            }
        });
    }
});