class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :primary_guest_id
      t.integer :max_guests
    end
  end
end
