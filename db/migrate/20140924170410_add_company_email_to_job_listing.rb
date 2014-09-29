class AddCompanyEmailToJobListing < ActiveRecord::Migration
  def change
  	add_column :job_listings, :notification_email, :string
  	add_index :job_listings, :notification_email
  end
end
