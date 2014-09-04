class AddUserToProfilePic < ActiveRecord::Migration
  def change
  	add_column :profile_pictures, :user_id, :integer
  	add_index :profile_pictures, :user_id
  end
end
