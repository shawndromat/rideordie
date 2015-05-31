# == Schema Information
#
# Table name: guest_rsvps
#
#  id       :integer          not null, primary key
#  rsvp_id  :integer          not null
#  guest_id :integer          not null
#  status   :boolean
#

class GuestRsvp < ActiveRecord::Base
  validates :rsvp, :guest, presence: true
  belongs_to :rsvp
  belongs_to :guest
end
