class ProfilePicture < ActiveRecord::Base
	belongs_to :user

	has_attached_file :asset, styles:{
		large: '500x500>',
		medium: '300x300>',
		small: '140x140>',
		thumb: '50x50#'
	}

	validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
end
