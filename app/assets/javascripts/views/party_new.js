RideOrDie.Views.PartyNew = Backbone.View.extend({
    template: JST["party_new"],
    events: {
      "submit form": "submit"
    },
    render: function () {
        var content = this.template();
        this.$el.html(content);
        return this;
    },
    submit: function (event) {
        event.preventDefault();
        var params = $(event.currentTarget).serializeJSON();
        this.model.set(params);
        this.model.save({}, {
            success: function() {
                this.collection.add(this.model, {merge: true});
                Backbone.history.navigate("party/" + this.model.id + "/edit", {trigger : true});
            }.bind(this)
        });
    }
});