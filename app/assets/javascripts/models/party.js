RideOrDie.Models.Party = Backbone.Model.extend({
    urlRoot: location.origin + "/api/parties",
    guests: function () {
        if (!this._guests) {
            this._guests = new RideOrDie.Collections.Guests([], {party: this})
        }

        return this._guests;
    },
    parse: function (response) {
        if (response.guests) {
            this.guests().set(response.guests, {parse: true});
            delete response.guests;
        }

        return response;
    }

})