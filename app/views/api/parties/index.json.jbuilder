json.array! @parties do |party|
  json.extract! party, :id, :name, :max_guests
  json.rsvp_status party.rsvp_status
end
