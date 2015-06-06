RideOrDie.Views.RsvpForm = Backbone.View.extend({
    template: JST["rsvp_form"],
    events: {
      "submit .rsvp-form": "submitRsvp"
    },
    render: function () {
        var content = this.template({rsvp: this.model});
        this.$el.html(content);
        this.attachGuestRows();
        return this;
    },
    attachGuestRows: function () {
        var $guestsRow = this.$('.guests');
        $guestsRow.empty();
        var that = this;
        this.model.guestRsvps().each(function(guestRsvp) {
            var view = new RideOrDie.Views.GuestRsvpRow({model: guestRsvp, rsvp: that.model});
            $guestsRow.append(view.render().$el);
        });
    },
    submitRsvp: function(event) {
      event.preventDefault();
      var that = this;
      if(this.allGuestRsvpsAnswered()) {
        this.model.guestRsvps().each(function(guestRsvp, index) {
          var success;
          if (index == that.model.guestRsvps().length - 1) {
            var formContent = $(".rsvp-form").serializeJSON();
            that.model.save(formContent);
            success = function () { location.href = location.origin};
          } else {
            success = function () {};
          }
          guestRsvp.save({}, {success: success});
        })
      } else {
        this.$(".guests").append(this.guestAlert());
      }
    },
    allGuestRsvpsAnswered: function () {
      return _.every(this.model.guestRsvps().models, function(guestRsvp) {
        var status = guestRsvp.get("status");
        return typeof status !== "undefined";
      });
    },
    guestAlert: function() {
      return '<div class="col-sm-8 alert alert-dismissable alert-danger"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>Please give a status for all guests</div>';
    }
});
