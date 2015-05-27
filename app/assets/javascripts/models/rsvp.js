RideOrDie.Models.Rsvp = Backbone.Model.extend({
    urlRoot: location.origin + "/api/rsvps",
    guestRsvps: function() {
      if (!this._guestRsvps) {
        this._guestRsvps = new RideOrDie.Collections.GuestRsvps();
      }
      return this._guestRsvps;
    },
    parse: function(response) {
      if (response.guest_rsvps) {
        this.guestRsvps().set(response.guest_rsvps, {parse: true});
        delete response.guest_rsvps;
      }
      return response;
    }
});
