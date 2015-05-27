json.extract! @rsvp, :id
json.party_name @rsvp.party.name
json.guest_rsvps @rsvp.guest_rsvps do |guest_rsvp|
  json.extract! guest_rsvp, :id, :status
  json.guest guest_rsvp.guest, :id, :name
end
