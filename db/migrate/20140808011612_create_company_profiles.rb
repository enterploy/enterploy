class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :company_name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code

      t.integer :user_id

      t.timestamps
    end

    add_index :company_profiles, :user_id
  end
end
