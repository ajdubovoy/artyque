require 'rails_helper'

RSpec.describe ContactForm, type: :model do
  it "should be valid when valid input is provided" do
    contact_form = build :contact_form
    p contact_form
    expect(contact_form.valid?).to be true
  end

  it "should be invalid when no email is provided" do
    contact_form = build :contact_form, :invalid
    expect(contact_form.valid?).to be false
  end

  it "should be marked spam when the nickname field is filled" do
    contact_form = build :contact_form, :spam
    expect(contact_form.spam?).to be true
  end
end
