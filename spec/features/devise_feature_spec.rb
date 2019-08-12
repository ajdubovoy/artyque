require 'rails_helper'

describe "DeviseFeature", type: :view do
  it "offers a logout option after successful login" do
    visit root_path
    click_link 'login'
    user = create(:user)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Log Out')
  end

  it "offers admins a link to the admin dashboard after login" do
    visit root_path
    click_link 'login'
    user = create(:user, :admin)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Admin Dashboard')
  end

  it "offers artist users a link to edit their artist page after login" do
    visit root_path
    click_link 'login'
    artist = create(:artist)
    user = artist.user
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_link("My Artist Profile", href: edit_artist_path(artist))
  end
end
