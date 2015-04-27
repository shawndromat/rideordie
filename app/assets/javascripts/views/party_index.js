RideOrDie.Views.PartyIndex = Backbone.View.extend({
    initialize: function () {
      this.listenTo(this.collection, 'sync', this.render);
    },
    template: JST["party_index"],
    render: function () {
        var content = this.template({parties: this.collection});
        this.$el.html(content);
        return this;
    }
})