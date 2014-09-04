json.array!(@profile_pictures) do |profile_picture|
  json.extract! profile_picture, :id
  json.url profile_picture_url(profile_picture, format: :json)
end
