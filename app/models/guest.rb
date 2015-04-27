class Guest < ActiveRecord::Base
  validates :party, presence: true

  belongs_to :party

  def plus_one?
    !name?
  end
end
