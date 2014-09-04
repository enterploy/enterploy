json.array!(@the_applications) do |the_application|
  json.extract! the_application, :id
  json.url the_application_url(the_application, format: :json)
end
