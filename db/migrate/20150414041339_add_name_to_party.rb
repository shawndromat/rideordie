class AddNameToParty < ActiveRecord::Migration
  def change
    add_column :parties, :name, :string, null: false
  end
end
