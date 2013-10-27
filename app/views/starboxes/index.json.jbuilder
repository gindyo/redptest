json.array!(@starboxes) do |starbox|
  json.extract! starbox, 
  json.url starbox_url(starbox, format: :json)
end
