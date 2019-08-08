require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  describe '#new' do
    login_admin

    it 'renders the right template' do
      get :new
      expect(response).to render_template :new
    end

    it 'makes a new artist' do
      get :new
      expect(assigns(:artist)).to be_instance_of Artist
    end
  end

  describe '#create' do
    login_admin

    context 'valid input' do
      it 'redirects to the admin dashboard page' do
        artist_attributes = FactoryBot.attributes_for(:artist)
        user_attributes = FactoryBot.attributes_for(:user)
        post :create, params: { artist: artist_attributes, user: user_attributes }
        expect(response).to redirect_to admin_dashboard_path
      end
    end

    context 'invalid input' do
      it 'rerenders the form' do
        artist_attributes = FactoryBot.attributes_for(:artist, :invalid)
        user_attributes = FactoryBot.attributes_for(:user)
        post :create, params: { artist: artist_attributes, user: user_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe '#show' do
    it 'renders the right template' do
      @artist = create(:artist)
      get :show, params: { id: @artist.id }
      expect(response).to render_template :show
    end

    it 'selects the correct artist' do
      @artist = create(:artist)
      get :show, params: { id: @artist.id }
      expect(assigns(:artist)).to be_instance_of Artist
      expect(assigns(:artist)).to eq @artist
    end
  end

  describe '#edit' do
    context '.header' do
      context 'html' do
        login_admin

        it 'renders the right template' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id }
          expect(response).to render_template :edit
        end

        it 'selects the correct artist and stage' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id }
          expect(assigns(:artist)).to be_instance_of Artist
          expect(assigns(:artist)).to eq @artist
          expect(assigns(:stage)).to eq :header
        end
      end

      context 'js' do
        login_admin

        it 'renders the right template' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, format: :js }
          expect(response).to render_template :edit
          expect(response.status).to eq(200)
        end
      end
    end

    context '.layout' do
      context 'html' do
        login_admin

        it 'renders the right template' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :layout }
          expect(response).to render_template :edit
        end

        it 'selects the correct artist and stage' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :layout }
          expect(assigns(:artist)).to be_instance_of Artist
          expect(assigns(:artist)).to eq @artist
          expect(assigns(:stage)).to eq :layout
        end
      end

      context 'js' do
        login_admin

        it 'renders the right template' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :layout, format: :js }
          expect(response).to render_template :edit
          expect(response.status).to eq(200)
        end
      end
    end

    context '.collections' do
      context 'html' do
        login_admin

        it 'renders the right template' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :collections }
          expect(response).to render_template :edit
        end

        it 'selects the correct artist' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :collections }
          expect(assigns(:artist)).to be_instance_of Artist
          expect(assigns(:artist)).to eq @artist
          expect(assigns(:stage)).to eq :collections
        end
      end

      context 'js' do
        login_admin

        it 'renders the right template' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :collections, format: :js }
          expect(response).to render_template :edit
          expect(response.status).to eq(200)
        end
      end
    end

    context '.links' do
      context 'html' do
        login_admin

        it 'renders the right template' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :links }
          expect(response).to render_template :edit
        end

        it 'selects the correct artist' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :links }
          expect(assigns(:artist)).to be_instance_of Artist
          expect(assigns(:artist)).to eq @artist
          expect(assigns(:stage)).to eq :links
        end
      end

      context 'js' do
        login_admin

        it 'renders the right template' do
          @artist = create(:artist)
          get :edit, params: { id: @artist.id, stage: :links, format: :js }
          expect(response).to render_template :edit
          expect(response.status).to eq(200)
        end
      end
    end
  end

  describe '#update' do
    context 'valid input' do
      context 'html' do
        login_admin

        it 'redirects to the edit artists page' do
          @artist = create(:artist)
          artist_attributes = FactoryBot.attributes_for(:artist)
          patch :update, params: { id: @artist.id, artist: artist_attributes }
          expect(response).to redirect_to edit_artist_path(@artist)
        end

        context 'and resume block is provided as nested attributes' do
          it 'redirects to the edit artists page' do
            @artist = create(:artist)
            artist_attributes = FactoryBot.attributes_for(:artist)
            artist_attributes[:resume_blocks] = FactoryBot.build_list(:resume_block, 3) # Nested attributes
            artist_attributes[:resume_blocks][0] = FactoryBot.build_list(:resume_item, 3) # Nested attributes
            patch :update, params: { id: @artist.id, artist: artist_attributes }
            expect(response).to redirect_to edit_artist_path(@artist)
          end
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          artist_attributes = FactoryBot.attributes_for(:artist)
          patch :update, params: { id: @artist.id, artist: artist_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end

    context 'invalid input' do
      context 'html' do
        login_admin

        it 'rerenders the form' do
          @artist = create(:artist)
          artist_attributes = FactoryBot.attributes_for(:artist, :invalid)
          patch :update, params: { id: @artist.id, artist: artist_attributes }
          expect(response).to render_template :edit
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          artist_attributes = FactoryBot.attributes_for(:artist, :invalid)
          patch :update, params: { id: @artist.id, artist: artist_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
