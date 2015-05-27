class AddStatusToGuestRsvp < ActiveRecord::Migration
  def change
    add_column :guest_rsvps, :status, :boolean
  end
end
