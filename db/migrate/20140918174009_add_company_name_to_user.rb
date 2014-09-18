class AddCompanyNameToUser < ActiveRecord::Migration
  def change
  	add_column :users, :company_name, :string
  	add_index :users, :company_name
  end
end
