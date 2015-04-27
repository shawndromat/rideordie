class Party < ActiveRecord::Base
  validates :max_guests, :name, presence: true

  has_many :guests, dependent: :destroy

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
end
