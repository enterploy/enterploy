class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :job_cateorgy, :name_of_company, :city_of_company, :state_of_company, :contact_name, :contact_number, :job_title
      t.boolean :full_part_time 
      t.text :skills_learned, :reason_for_leaving
      t.date :start_date, :end_date
      t.integer :user_id

      t.timestamps
    end
    add_index :employments, :user_id
  end
end
