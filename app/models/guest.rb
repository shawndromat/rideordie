class Guest < ActiveRecord::Base
  validate :ensure_name_or_plus_one

  private
  def ensure_name_or_plus_one
    unless !!name ^ !!plus_one
      errors[:base] <<  "Guest must be named or a plus one"
    end
  end
end
