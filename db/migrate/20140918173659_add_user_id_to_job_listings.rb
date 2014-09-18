class AddUserIdToJobListings < ActiveRecord::Migration
  def change
  	add_column :job_listings, :user_id, :integer
  	add_index :job_listings, :user_id
  end
end
