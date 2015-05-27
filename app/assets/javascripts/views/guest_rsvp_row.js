RideOrDie.Views.GuestRsvpRow = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model.guest(), "sync", this.render);
  },
  className: "row",
  template: JST["guest_rsvp_row"],
  events: {
    'blur input[type="text"]': "saveGuest",
    'click .edit-name': "editName"
  },
  render: function() {
      var content = this.template({
        guestRsvp: this.model,
        guest: this.model.guest()
      });
      this.$el.html(content);
      return this;
  },
  saveGuest: function(event) {
    var name = $(event.currentTarget).val();
    this.model.guest().set({name: name});
    this.model.guest().save();
  },
  editName: function() {
              console.log("jjj");
    this.model.guest().set({name: ""});
    this.render();
  }
});
