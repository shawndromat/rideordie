class AddTimestampsToGuestsAndParty < ActiveRecord::Migration
  def change
    add_column(:guests, :created_at, :datetime)
    add_column(:guests, :updated_at, :datetime)
    add_column(:parties, :created_at, :datetime)
    add_column(:parties, :updated_at, :datetime)
  end
end
