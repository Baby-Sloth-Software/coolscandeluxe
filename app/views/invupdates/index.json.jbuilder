json.array!(@invupdates) do |invupdate|
  json.extract! invupdate, :id
  json.url invupdate_url(invupdate, format: :json)
end
