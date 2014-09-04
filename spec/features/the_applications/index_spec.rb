require "spec_helper.rb"

describe "Listing the_applications" do
	it "requires login" do
		visit "/the_applications"
		expect(page).to have_content("You must be logged in")
	end
end