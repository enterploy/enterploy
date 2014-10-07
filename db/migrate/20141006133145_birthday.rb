class Birthday < ActiveRecord::Migration
  def change
  	# add_column :the_applications, :date_of_birth, :date
  	remove_column :the_applications, :birthday
  	
  end
end
