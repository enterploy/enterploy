require 'spec_helper'

describe User do 
	# example user
	let(:valid_attributes){
		{
			first_name: "Dave",
			last_name: "Faliskie",
			email: "dave@enterploy.com",
			password: "enterploy1234",
			password_confirmation: "enterploy1234"
		}
	}

	context "relationshops" do
		it{should have_many(:the_applications)}
	end

	context "validations" do 
		let(:user){ User.new(valid_attributes)}

		#creates a user
		before do
			User.create(valid_attributes)
		end

		#makes sure the user has an email
		it "requires an email" do
			expect(user).to validate_presence_of(:email)
		end


		#make sure user has a unique email
		it "requires a unique email" do 
			expect(user).to validate_uniqueness_of(:email)
		end

		it "requires a unique email (case insensitive)" do 
			user.email = "DAVE@ENTERPLOY.COM"
			expect(user).to validate_uniqueness_of(:email)
		end

		it "requires the email to look like an email address" do
			user.email = "dave"
			expect(user).to_not be_valid
		end

	end



	describe "#downcase_email" do 
		it "makes email attribute lower case" do
			user = User.new(valid_attributes.merge(email: "DAVE@ENTERPLOY.COM"))
			#user.downcase_email
			#expect(user.email).to eq("dave@enterploy.com")
			expect{ user.downcase_email }.to change{ user.email }.
				from("DAVE@ENTERPLOY.COM").
				to("dave@enterploy.com")

		end

	it "downcases an email before saving" do 
			user = User.new(valid_attributes)
			user.email = "DAVE@ENTERPLOY.COM"
			expect(user.save).to be_truthy
			expect(user.email).to eq("dave@enterploy.com")
		end
	end



end








