class AddOrderToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :order, :integer
  end
end
