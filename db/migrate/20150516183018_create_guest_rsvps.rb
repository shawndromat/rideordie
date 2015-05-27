class CreateGuestRsvps < ActiveRecord::Migration
  def change
    create_table :guest_rsvps do |t|
      t.integer :rsvp_id, null: false
      t.integer :guest_id, null: false
    end
  end
end
