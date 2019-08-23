require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe '#dashboard' do
    login_admin

    it "assigns the artists" do
      get :dashboard
      expect(assigns(:artists)).to match_array Artist.all
    end

    it "assigns the news posts" do
      get :dashboard
      expect(assigns(:news_posts)).to match_array NewsPost.all
    end
  end
end
