class GuestRsvp < ActiveRecord::Base
  validates :rsvp, :guest, presence: true
  belongs_to :rsvp
  belongs_to :guest
end
