class AddUrlToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :url, :string
  end
end
