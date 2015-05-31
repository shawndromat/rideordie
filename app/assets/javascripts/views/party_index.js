RideOrDie.Views.PartyIndex = Backbone.View.extend({
    initialize: function () {
      this.listenTo(this.collection, 'sync', this.render);
    },
    template: JST["party_index"],
    render: function () {
        var content = this.template({parties: this.collection});
        this.$el.html(content);
        this.attachPartyRows();
        return this;
    },
    attachPartyRows: function () {
      var $partiesTable = this.$('.parties-table');
      $partiesTable.append(this.headerRow());
      this.collection.each(function(party) {
        console.log(party.get("rsvp_url"))
        var view = new RideOrDie.Views.PartyRow({
          model: party
        });
        $partiesTable.append(view.render().$el);
      });
    },
    headerRow: function () {
    return "<tr>" +
      '<th class="col-sm-5">Party</th>' + 
      '<th class="col-sm-2">Number of Invitees</th>' + 
      '<th class="col-sm-2">Number Attending</th>' + 
      '<th class="col-sm-2">RSVP</th>' + 
    "</tr>";
    }
})
