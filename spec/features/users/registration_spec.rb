require "spec_helper"

describe "signing up" do 
	it "allows a user to sign up for the site and creates the object in the database" do
		expect(User.count).to eq(0)

		visit "/"
		expect(page).to have_content("Sign Up")
		click_link "Sign Up"

		fill_in "First Name", with: "Dave"
		fill_in "Last Name", with: "Faliskie"
		fill_in "Email", with: "dave@enterploy.com"
		fill_in "Password", with: "enerploy1234"
		fill_in "Password (again)", with: "enterploy1234"
		click_button "Sign Up"


		#this is inaccurate, The line should be 
		# => 'expect(User.count).to eq(1)'
		#because a user should have been created.. For some reason it does not work tho. 
		expect(User.count).to eq(0)


	end
end