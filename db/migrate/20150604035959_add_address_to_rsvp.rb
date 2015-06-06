class AddAddressToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :address_line_one, :string
    add_column :rsvps, :address_line_two, :string
    add_column :rsvps, :city, :string
    add_column :rsvps, :state, :string
    add_column :rsvps, :country, :string
    add_column :rsvps, :postal_code, :string
  end
end
