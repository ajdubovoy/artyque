require 'rails_helper'

describe "ContactFormsFeature", type: :view do
  it "delivers a valid message" do
    visit '/contact'
    fill_in 'First name', match: :first, :with => 'Aaron'
    fill_in 'Last name', match: :first, :with => 'Sumner'
    fill_in 'Email', match: :first, :with => 'aaron@everydayrails.com'
    select 'A Gallery', from: 'contact_form_role', match: :first
    fill_in 'Nickname', match: :first, :with => nil
    fill_in 'Message (optional)', match: :first, :with => 'What a great website.'
    click_button 'Send', match: :first
    expect(page).to have_content 'Thank You for Your Message'
    expect(last_email).to have_content 'aaron@everydayrails.com'
  end

  it "does not deliver a message with a missing email" do
    visit '/contact'
    fill_in 'First name', match: :first, :with => 'Aaron'
    fill_in 'Last name', match: :first, :with => 'Sumner'
    select 'A Gallery', from: 'contact_form_role', match: :first
    fill_in 'Message (optional)', match: :first, :with => 'What a great website.'
    click_button 'Send', match: :first
    expect(page).to have_content "Email can't be blank"
    expect(last_email).to be_nil
  end

  it "does not deliver spam" do
    visit '/contact'
    fill_in 'First name', match: :first, :with => 'Aaron'
    fill_in 'Last name', match: :first, :with => 'Sumner'
    fill_in 'Email', match: :first, :with => 'spammer@spammyjunk.com'
    fill_in 'Message (optional)', match: :first, :with => "All the junk you'll never need."
    fill_in 'Nickname', match: :first, :with => 'Want to buy some boots?'
    click_button 'Send', match: :first
    expect(page).to have_content('Leave this field blank!')
    expect(last_email).to be_nil
  end
end
