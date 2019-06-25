require 'rails_helper'

RSpec.describe AdminController, '#dashboard' do
  login_admin

  it "assigns the artists" do
    get :dashboard
    expect(assigns(:artists)).to eq Artist.all
  end
end
