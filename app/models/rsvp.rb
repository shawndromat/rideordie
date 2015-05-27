class Rsvp<ActiveRecord::Base
  validates :party, presence: true
  belongs_to :party
  has_many :guest_rsvps

  def answered?
    guest_rsvps.count > 0
  end
end
