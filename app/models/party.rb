# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  max_guests :integer
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Party < ActiveRecord::Base
  validates :max_guests, :name, presence: true

  has_many :guests, dependent: :destroy
  has_one :rsvp, dependent: :destroy

  def all_guests
    make_new_guests if new_guest_count > 0

    guests.order(:created_at)
  end

  def new_guest_count
    max_guests - guests.count
  end

  def make_new_guests
    Guest.transaction do
      new_guest_count.times do
        guest = Guest.new(party_id: id)
        guest.save
      end
    end
  end

  def rsvp_sent?
    !!rsvp
  end

  def rsvp_status
    if rsvp_sent?
      if rsvp.answered?
        "Answered"
      else
        "Sent"
      end
    else
      "Not sent"
    end
  end

  def invite
    unless rsvp
      transaction do
        rsvp = Rsvp.new(party_id: id)
        rsvp.save
        guests.each_with_index do |guest|
          guest_rsvp = rsvp.guest_rsvps.new(guest: guest)
          guest_rsvp.save
        end
      end
    end
  end
end
