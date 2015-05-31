# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  party_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Guest < ActiveRecord::Base
  validates :party, presence: true

  belongs_to :party

  def plus_one?
    !name?
  end
end
