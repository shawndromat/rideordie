json.extract!(@party, :id, :name, :max_guests)
json.rsvp_id @party.rsvp.id

json.guests @party.all_guests do |guest|
  json.name guest.name || ""
  json.id guest.id
end
