json.array! @parties do |party|
  json.extract! party, :id, :name, :max_guests
  json.rsvp_id party.rsvp.id
  json.rsvp_status party.rsvp_status
  if party.rsvp
    json.rsvp_url party.rsvp.url
    if party.rsvp.answered?
      json.num_guests party.rsvp.confirmed_guests
    end
  end
end
