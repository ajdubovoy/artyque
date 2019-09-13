require 'rails_helper'

RSpec.describe NewsPostsController, type: :controller do
  describe '#index' do
    it 'renders the right template' do
      get :index
      expect(response).to render_template :index
    end

    it 'sets the news posts' do
      get :index
      expect(assigns(:news_posts)).to eq NewsPost.all
    end
  end

  describe '#show' do
    it 'renders the right template' do
      @news_post = create(:news_post)
      get :show, params: { id: @news_post.id }
      expect(response).to render_template :show
    end

    it 'selects the correct news_post' do
      @news_post = create(:news_post)
      get :show, params: { id: @news_post.id }
      expect(assigns(:news_post)).to be_instance_of NewsPost
      expect(assigns(:news_post)).to eq @news_post
    end
  end

  describe '#new' do
    login_admin

    it 'renders the right template' do
      get :new
      expect(response).to render_template :new
    end

    it 'makes a new news_post' do
      get :new
      expect(assigns(:news_post)).to be_instance_of NewsPost
    end
  end

  describe '#create' do
    login_admin

    context 'valid input' do
      it 'redirects to the admin dashboard page' do
        news_post_attributes = FactoryBot.attributes_for(:news_post)
        post :create, params: { news_post: news_post_attributes }
        expect(response).to redirect_to admin_dashboard_path
      end
    end

    context 'invalid input' do
      it 'rerenders the form' do
        news_post_attributes = FactoryBot.attributes_for(:news_post, :invalid)
        user_attributes = FactoryBot.attributes_for(:user)
        post :create, params: { news_post: news_post_attributes, user: user_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe '#edit' do
    login_admin

    it 'renders the right template' do
      @news_post = create(:news_post)
      get :edit, params: { id: @news_post.id }
      expect(response).to render_template :edit
    end

    it 'selects the correct news_post' do
      @news_post = create(:news_post)
      get :edit, params: { id: @news_post.id }
      expect(assigns(:news_post)).to be_instance_of NewsPost
      expect(assigns(:news_post)).to eq @news_post
    end
  end

  describe '#update' do
    login_admin

    context 'valid input' do
      it 'redirects to the admin dashboard page' do
        @news_post = create(:news_post)
        news_post_attributes = FactoryBot.attributes_for(:news_post)
        patch :update, params: { id: @news_post.id, news_post: news_post_attributes }
        expect(response).to redirect_to admin_dashboard_path
      end
    end

    context 'invalid input' do
      it 'rerenders the form' do
        @news_post = create(:news_post)
        news_post_attributes = FactoryBot.attributes_for(:news_post, :invalid)
        user_attributes = FactoryBot.attributes_for(:user)
        post :create, params: { id: @news_post.id, news_post: news_post_attributes, user: user_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe '#destroy' do
    login_admin

    it 'redirects correctly' do
      @news_post = create(:news_post)
      delete :destroy, params: { id: @news_post.id }
      expect(response).to redirect_to admin_dashboard_path
    end

    it 'destroys the news_post' do
      @news_post = create(:news_post)
      delete :destroy, params: { id: @news_post.id }
      expect(NewsPost.exists? @news_post.id).to be false
    end
  end
end
