class RemovePlusOneFromGuest < ActiveRecord::Migration
  def change
    remove_column :guests, :plus_one
  end
end
