class AddUserIdToEducations < ActiveRecord::Migration
  def change
  	add_column :educations, :user_id, :integer
  	add_index :educations, :user_id
  end
end
