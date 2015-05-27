class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :party_id, null: false
      t.text    :message
    end
  end
end
