class AddCompanyIdToUserApp < ActiveRecord::Migration
  def change
  	add_column :user_apps, :company_id, :integer
  	add_index :user_apps, :company_id
  end
end
