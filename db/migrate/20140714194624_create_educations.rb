class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
    	t.string :school_name, :school_city, :school_state, :degree_type, :degree_status, :area_of_study
 		t.date :graduation_year

      t.timestamps
    end
  end
end
