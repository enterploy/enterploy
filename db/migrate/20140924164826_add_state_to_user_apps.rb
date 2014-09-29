class AddStateToUserApps < ActiveRecord::Migration
  def change
  	add_column :user_apps, :state, :string
  	add_index :user_apps, :state
  end
end
