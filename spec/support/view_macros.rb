module ViewMacros
  def login_admin
    visit root_path
    click_link 'login'
    user = create(:user, :admin)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end
end
