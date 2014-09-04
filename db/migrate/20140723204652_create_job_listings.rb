class CreateJobListings < ActiveRecord::Migration
  def change
    create_table :job_listings do |t|
      t.string :company_name, :company_city, :company_state, :job_type, :job_title
      t.text :job_description, :job_responsibilities, :job_benefits
      t.float :pay_range

      t.timestamps
    end
  end
end
