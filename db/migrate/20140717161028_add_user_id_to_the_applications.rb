class AddUserIdToTheApplications < ActiveRecord::Migration
  def change
  	add_column :the_applications, :user_id, :integer
  	add_index :the_applications, :user_id
  end
end
