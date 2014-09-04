require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the new template" do 
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "POST 'create'" do
    ################
    context "with correct credentials" do 
      let!(:user) {User.create(first_name: "Dave", last_name: "faliskie", email: "dave@enterploy.com", password: "enterploy1", password_confirmation: "enterploy1")}
      it "redirects to the application list path" do 
        post :create, email: "dave@enterploy.com", password: "enterploy1"
        expect(response).to be_redirect
        expect(response).to redirect_to(the_applications_path)
      end

      it "find the user" do
        expect(User).to receive(:find_by).with({email: "dave@enterploy.com"}).and_return(user)
        post :create, email: "dave@enterploy.com", password: "enterploy1"
      end


      it "authenticates the user" do 
        User.stub(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, email: "dave@enterploy.com", password: "enterploy1"
      end

      it "sets the user_id in the session" do
        post :create, email: "dave@enterploy.com", password: "enterploy1"
        expect(session[:user_id]).to eq(user.id)
      end

      it "sets the flash success message" do 
        post :create, email: "dave@enterploy.com", password: "enterploy1"
        expect(flash[:notice]).to eq("Thanks for logging in!")
      end

    end

    #...............

    shared_examples_for "denied login" do
      it "renders the new template" do 
        post :create, email: email, password: password
        expect(response).to render_template('new')
      end

      it "sets the flash error message" do 
        post :create, email: email, password: password
        expect(flash[:error]).to eq("There was a problem logging in. Please check your email and password.")
      end
    end
    

    ###############
    context "with blank credentials" do 
      let(:email){""}
      let(:password){""}
      it_behaves_like "denied login"
    end

    ###############
    context "with an inncorrect password" do 
      let!(:user) {User.create(first_name: "Dave", last_name: "faliskie", email: "dave@enterploy.com", password: "enterploy1", password_confirmation: "enterploy1")}
      let(:email){user.email}
      let(:password){"inncorrect"}
      it_behaves_like "denied login"
    end

    ##############
    context "with no email in existence" do
      let(:email){"none@found.com"}
      let(:password){"inncorrect"}
      it_behaves_like "denied login"
    end


  end
end
