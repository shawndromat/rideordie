RideOrDie.Models.GuestRsvp = Backbone.Model.extend({
  urlRoot: location.origin + "/api/guest_rsvps",
  guest: function () {
    if (!this._guest) {
      this._guest = new RideOrDie.Models.Guest();
    }
    return this._guest;
  },
  parse: function (response) {
    if (response.guest) {
      this.guest().set(response.guest);
      delete response.guest;
    }
    return response;
  }
});
