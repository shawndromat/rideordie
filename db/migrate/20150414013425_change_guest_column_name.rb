class ChangeGuestColumnName < ActiveRecord::Migration
  def change
    rename_column :guests, :guest, :plus_one
  end
end
