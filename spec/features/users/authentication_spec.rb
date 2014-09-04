require "spec_helper"

describe "Logging In" do
	it "logs the user in and goes to the_applications page" do 
		User.create(first_name: "Dave", last_name: "faliskie", email: "dave@enterploy.com", password: "enterploy1", password_confirmation: "enterploy1")
		visit new_user_session_path
		fill_in "Email Address", with: "dave@enterploy.com"
		fill_in "Password", with: "enterploy1"
		click_button "Log In"

		expect(page).to have_content("This is your Application!")
		expect(page).to have_content("Thanks for logging in!")
	end
	
	it "displays the email address in the event of a failed login" do
		visit new_user_session_path
		fill_in "Email Address", with: "dave@enterploy.com"
		fill_in "password", with: "wrong"
		click_button "Log In"

		expect(page).to have_content("Please check your email and password")
		expect(page).to have_field("Email Address", with: "dave@enterploy.com")
	end
end
