require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe '#new' do
    login_admin

    it 'renders the right template' do
      get :new
      expect(response).to render_template :new
    end

    it 'makes a new category' do
      get :new
      expect(assigns(:category)).to be_instance_of Category
    end
  end

  describe '#create' do
    login_admin

    context 'valid input' do
      it 'redirects to the admin dashboard page' do
        category_attributes = FactoryBot.attributes_for(:category)
        post :create, params: { category: category_attributes }
        expect(response).to redirect_to admin_dashboard_path
      end
    end

    context 'invalid input' do
      it 'rerenders the form' do
        category_attributes = FactoryBot.attributes_for(:category, :invalid)
        user_attributes = FactoryBot.attributes_for(:user)
        post :create, params: { category: category_attributes, user: user_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe '#edit' do
    login_admin

    it 'renders the right template' do
      @category = create(:category)
      get :edit, params: { id: @category.id }
      expect(response).to render_template :edit
    end

    it 'selects the correct category' do
      @category = create(:category)
      get :edit, params: { id: @category.id }
      expect(assigns(:category)).to be_instance_of Category
      expect(assigns(:category)).to eq @category
    end
  end

  describe '#update' do
    login_admin

    context 'valid input' do
      it 'redirects to the admin dashboard page' do
        @category = create(:category)
        category_attributes = FactoryBot.attributes_for(:category)
        patch :update, params: { id: @category.id, category: category_attributes }
        expect(response).to redirect_to admin_dashboard_path
      end
    end

    context 'invalid input' do
      it 'rerenders the form' do
        @category = create(:category)
        category_attributes = FactoryBot.attributes_for(:category, :invalid)
        user_attributes = FactoryBot.attributes_for(:user)
        post :create, params: { id: @category.id, category: category_attributes, user: user_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe '#destroy' do
    login_admin

    it 'redirects to the edit collection page' do
      @category = create(:category)
      delete :destroy, params: { id: @category.id }
      expect(response).to redirect_to admin_dashboard_path
    end

    it 'destroys the artwork' do
      @category = create(:category)
      delete :destroy, params: { id: @category.id }
      expect(Category.exists? @category.id).to be false
    end
  end
end
