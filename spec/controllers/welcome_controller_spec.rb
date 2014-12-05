require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET #index" do
    before :each do
      @user = User.new
    end

    it "should render the index view without a user" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render the dashboard view with the angular template" do
      sign_in @user
      get :dashboard
      expect(response).to render_template :dashboard
      expect(response).to render_template layout: "layouts/angular"
    end

    it "should redirect from dashboard view to index without a user" do
      get :dashboard
      expect(response).to redirect_to root_url
    end
  end
end
