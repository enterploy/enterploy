class CreateTheApplications < ActiveRecord::Migration
  def change
    create_table :the_applications do |t|

      t.date :birthday  
	  t.string :street_address, :city, :state, :zip_code, :country, :phone_number
	  t.boolean :eligable_to_work
      t.timestamps
    end
  end
end
