RideOrDie.Collections.Parties = Backbone.Collection.extend({
    url: location.origin + '/api/parties',
    model: RideOrDie.Models.Party,
    getOrFetch: function (id) {
        var party = RideOrDie.parties.get(id);
        if (!party) {
            party = new RideOrDie.Models.Party({id: id});
        }
        party.fetch({
            success: function () {RideOrDie.parties.add(party), {merge: true}}
        });
        return party;
    }
})