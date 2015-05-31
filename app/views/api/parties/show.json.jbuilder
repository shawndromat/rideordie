json.extract!(@party, :id, :name, :max_guests)

json.guests @party.all_guests do |guest|
  json.name guest.name || ""
  json.id guest.id
end
