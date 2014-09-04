class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|

      t.timestamps
    end
    add_attachment :profile_pictures, :asset
  end
end
