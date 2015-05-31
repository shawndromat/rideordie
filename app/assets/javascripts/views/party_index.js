RideOrDie.Views.PartyIndex = Backbone.View.extend({
    initialize: function () {
      this.listenTo(this.collection, 'sync', this.render);
    },
    template: JST["party_index"],
    events: {
      "submit .send-invite": "sendInvite"
    },
    render: function () {
        var content = this.template({parties: this.collection});
        this.$el.html(content);
        return this;
    },
    sendInvite: function (event) {
      event.preventDefault();
      var $form = $(event.currentTarget);
      $.ajax({
        method: "GET",
        url: location.origin + "/api/parties/" + $form.data("id") + "/invite"
      });
    }
})
