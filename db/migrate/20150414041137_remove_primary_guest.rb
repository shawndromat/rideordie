class RemovePrimaryGuest < ActiveRecord::Migration
  def change
    remove_column :parties, :primary_guest_id
  end
end
