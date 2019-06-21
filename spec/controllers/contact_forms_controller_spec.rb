require 'rails_helper'

RSpec.describe ContactFormsController, type: :controller do
  describe 'when filling in the contact form (#create)' do
    context 'and the input is valid' do
      context 'HTML' do
        it 'should render success' do
          contact_form_attributes = build :contact_form
          post :create, params: { contact_form: contact_form_attributes }
          expect(response).to redirect_to contact_forms_success_path
        end
      end
      context 'JS' do
        it 'should render success' do
          contact_form_attributes = build :contact_form
          post :create, params: { contact_form: contact_form_attributes }, format: :js
          expect(response.status).to eq(200)
        end
      end
    end
    context 'and the input is invalid' do
      context 'HTML' do
        it 'should re-render form' do
          contact_form_attributes = build :contact_form, :invalid
          post :create, params: { contact_form: contact_form_attributes }
          expect(response).to render_template 'pages/home'
        end
      end
      context 'JS' do
        it 'should render say that email can\'t be blank' do
          contact_form_attributes = build :contact_form, :invalid
          post :create, params: { contact_form: contact_form_attributes }, format: :js
          parsed_response_body = JSON.parse(response.body)
          expect(parsed_response_body["email"]).to eq(["can't be blank"])
        end
      end
    end
  end
end
