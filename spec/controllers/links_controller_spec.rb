require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe '#new' do
    context 'html' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        get :new, params: { artist_id: @artist.id }
        expect(response).to render_template :new
      end

      it 'selects the correct artist' do
        @artist = create(:artist)
        get :new, params: { artist_id: @artist.id }
        expect(assigns(:artist)).to be_instance_of Artist
        expect(assigns(:artist)).to eq @artist
      end

      it 'makes a new link' do
        @artist = create(:artist)
        @link = Link.new
        get :new, params: { artist_id: @artist.id }
        expect(assigns(:link)).to be_instance_of Link
      end
    end

    context 'js' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        get :new, params: { artist_id: @artist.id }
        expect(response).to render_template :new
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#create' do
    context 'valid input' do
      context 'html' do
        login_admin

        it 'redirects to the edit links page' do
          @artist = create(:artist)
          link_attributes = FactoryBot.attributes_for(:link)
          post :create, params: { artist_id: @artist.id, link: link_attributes }
          expect(response).to redirect_to edit_artist_path(@artist, stage: :links)
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          link_attributes = FactoryBot.attributes_for(:link)
          post :create, params: { artist_id: @artist.id, link: link_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end

    context 'invalid input' do
      context 'html' do
        login_admin

        it 'rerenders the form' do
          @artist = create(:artist)
          link_attributes = FactoryBot.attributes_for(:link, :invalid)
          post :create, params: { artist_id: @artist.id, link: link_attributes }
          expect(response).to render_template :new
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          link_attributes = FactoryBot.attributes_for(:link, :invalid)
          post :create, params: { artist_id: @artist.id, link: link_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end
  end

  describe '#edit' do
    context 'html' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        @link = @artist.links.sample
        get :edit, params: { id: @link.id }
        expect(response).to render_template :edit
      end

      it 'selects the correct link' do
        @artist = create(:artist)
        @link = @artist.links.sample
        get :edit, params: { id: @link.id }
        expect(assigns(:link)).to be_instance_of Link
        expect(assigns(:link)).to eq @link
      end
    end

    context 'js' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        @link = @artist.links.sample
        get :edit, params: { id: @link.id }
        expect(response).to render_template :edit
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#update' do
    context 'valid input' do
      context 'html' do
        login_admin

        it 'redirects to the edit links page' do
          @artist = create(:artist)
          @link = @artist.links.sample
          link_attributes = FactoryBot.attributes_for(:link)
          patch :update, params: { id: @link.id, link: link_attributes }
          expect(response).to redirect_to edit_artist_path(@artist, stage: :links)
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @link = @artist.links.sample
          link_attributes = FactoryBot.attributes_for(:link)
          patch :update, params: { id: @link.id, link: link_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end

    context 'invalid input' do
      context 'html' do
        login_admin

        it 'rerenders the form' do
          @artist = create(:artist)
          @link = @artist.links.sample
          link_attributes = FactoryBot.attributes_for(:link, :invalid)
          patch :update, params: { id: @link.id, link: link_attributes }
          expect(response).to render_template :edit
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @link = @artist.links.sample
          link_attributes = FactoryBot.attributes_for(:link, :invalid)
          patch :update, params: { id: @link.id, link: link_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end
  end

  describe '#destroy' do
    context 'html' do
      login_admin

      it 'redirects to the edit links page' do
        @artist = create(:artist)
        @link = @artist.links.sample
        delete :destroy, params: { id: @link.id }
        expect(response).to redirect_to edit_artist_path(@artist, stage: :links)
      end

      it 'destroys the link' do
        @artist = create(:artist)
        @link = @artist.links.sample
        delete :destroy, params: { id: @link.id }
        expect(Link.exists? @link.id).to be false
      end
    end

    context 'js' do
      login_admin

      it 'returns a successful response' do
        @artist = create(:artist)
        @link = @artist.links.sample
        delete :destroy, params: { id: @link.id }, format: :js
        expect(response.status).to eq(200)
      end
    end
  end
end
