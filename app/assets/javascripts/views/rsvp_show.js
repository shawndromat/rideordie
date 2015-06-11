RideOrDie.Views.RsvpShow = Backbone.View.extend({
  template: JST["rsvp_show"],
  render: function () {
    var content = this.template({rsvp: this.model});
    this.$el.html(content);
    return this;
  }
});
