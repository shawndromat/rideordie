json.extract! @rsvp, :id, :message, :address_line_one, :address_line_two, :country, :state, :city, :postal_code, :country
json.party_name @rsvp.party.name
json.guest_rsvps @rsvp.ordered_guests do |guest_rsvp|
  json.extract! guest_rsvp, :id, :status
  json.guest guest_rsvp.guest, :id, :name, :order
end
