class AddCompanyProfileIdToJobListings < ActiveRecord::Migration
  def change
  	add_column :job_listings, :company_profile_id, :integer
  	add_index :job_listings, :company_profile_id
  end
end
