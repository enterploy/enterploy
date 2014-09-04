class CreateApplyingJobs < ActiveRecord::Migration
  def change
    create_table :applying_jobs do |t|
      t.integer :user_id
      t.integer :job_listing_id
      t.timestamps
    end

    add_index :applying_jobs, [:user_id, :job_listing_id]
  end
end
