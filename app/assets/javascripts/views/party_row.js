RideOrDie.Views.PartyRow = Backbone.View.extend({
  template: JST["party_row"],
  tagName: "tr",
  events: {
    "submit .send-invite": "sendInvite"
  },
  render: function() {
    var content = this.template({party: this.model});
    this.$el.html(content);
    return this;
  },
  sendInvite: function (event) {
    event.preventDefault();
    var $form = $(event.currentTarget);
    var that = this;
    $.ajax({
      method: "GET",
      url: location.origin + "/api/parties/" + $form.data("id") + "/invite",
      success: function (data) {
        that.model.set("rsvp_url", data.rsvp_url);
        that.model.set("rsvp_status", "Sent");
        that.render();
      }
    });
  },
});
