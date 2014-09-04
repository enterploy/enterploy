json.array!(@company_profiles) do |company_profile|
  json.extract! company_profile, :id, :company_name, :street_address, :city, :state, :zip_code
  json.url company_profile_url(company_profile, format: :json)
end
