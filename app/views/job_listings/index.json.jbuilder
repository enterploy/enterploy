json.array!(@job_listings) do |job_listing|
  json.extract! job_listing, :id
  json.url job_listing_url(job_listing, format: :json)
end
