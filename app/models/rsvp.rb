# == Schema Information
#
# Table name: rsvps
#
#  id       :integer          not null, primary key
#  party_id :integer          not null
#  message  :text
#  url      :string(255)
#

class Rsvp<ActiveRecord::Base
  validates :party, :url, presence: true
  belongs_to :party
  has_many :guest_rsvps

  before_validation :generate_url

  def answered?
    guest_rsvps.count > 1 && guest_rsvps.none? {|rsvp| rsvp.status.nil?}
  end

  def confirmed_guests
    guest_rsvps.map{|rsvp| rsvp.status ? 1 : 0}.sum
  end

  def encoded_url
    URI.encode(self.url)
  end

  def ordered_guests
    guest_rsvps.includes(:guest).order("guests.order")
  end

  private
  def generate_url
    self.url = party.name
  end
end
