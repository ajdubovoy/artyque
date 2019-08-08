require 'rails_helper'

RSpec.describe ArtworksController, type: :controller do
  login_admin

  describe '#show' do
    it 'renders the right template' do
      @artist = create(:artist)
      @artwork = @artist.artworks.sample
      get :show, params: { id: @artwork.id }
      expect(response).to render_template :show
    end

    it 'selects the correct artist' do
      @artist = create(:artist)
      @artwork = @artist.artworks.sample
      get :show, params: { id: @artwork.id }
      expect(assigns(:artwork)).to be_instance_of Artwork
      expect(assigns(:artwork)).to eq @artwork
    end

    context 'xhr for modal' do
      it 'renders a partial for modal' do
        @artist = create(:artist)
        @artwork = @artist.artworks.sample
        get :show, params: { id: @artwork.id }, xhr: true
        expect(JSON.parse(response.body).has_key? 'html').to be true
      end
    end
  end

  describe '#new' do
    context 'html' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        get :new, params: { collection_id: @collection.id }
        expect(response).to render_template :new
      end

      it 'selects the correct collection' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        get :new, params: { collection_id: @collection.id }
        expect(assigns(:collection)).to be_instance_of Collection
        expect(assigns(:collection)).to eq @collection
      end

      it 'makes a new artwork' do
        @artist = create(:artist)
        @artwork = Artwork.new
        @collection = @artist.collections.sample
        get :new, params: { collection_id: @collection.id }
        expect(assigns(:artwork)).to be_instance_of Artwork
      end
    end

    context 'js' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        get :new, params: { collection_id: @collection.id, format: :js }
        expect(response).to render_template :new
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#create' do
    context 'valid input' do
      context 'html' do
        login_admin

        it 'redirects to the edit artworks page' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          artwork_attributes = FactoryBot.attributes_for(:artwork)
          post :create, params: { collection_id: @collection.id, artwork: artwork_attributes }
          expect(response).to redirect_to edit_collection_path(@collection)
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          artwork_attributes = FactoryBot.attributes_for(:artwork)
          post :create, params: { collection_id: @collection.id, artwork: artwork_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end

    context 'invalid input' do
      context 'html' do
        login_admin

        it 'rerenders the form' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          artwork_attributes = FactoryBot.attributes_for(:artwork, :invalid)
          post :create, params: { collection_id: @collection.id, artwork: artwork_attributes }
          expect(response).to render_template :new
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          artwork_attributes = FactoryBot.attributes_for(:artwork, :invalid)
          post :create, params: { collection_id: @collection.id, artwork: artwork_attributes, format: :js }
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
        @collection = @artist.collections.sample
        @artwork = @collection.artworks.sample
        get :edit, params: { id: @artwork.id }
        expect(response).to render_template :edit
      end

      it 'selects the correct artwork' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        @artwork = @collection.artworks.sample
        get :edit, params: { id: @artwork.id }
        expect(assigns(:artwork)).to be_instance_of Artwork
        expect(assigns(:artwork)).to eq @artwork
      end
    end

    context 'js' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        @artwork = @collection.artworks.sample
        get :edit, params: { id: @artwork.id }
        expect(response).to render_template :edit
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#update' do
    context 'valid input' do
      context 'html' do
        login_admin

        it 'redirects to the edit artworks page' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          @artwork = @collection.artworks.sample
          artwork_attributes = FactoryBot.attributes_for(:artwork)
          patch :update, params: { id: @artwork.id, artwork: artwork_attributes }
          expect(response).to redirect_to edit_artist_path(@artist, stage: :artworks)
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          @artwork = @collection.artworks.sample
          artwork_attributes = FactoryBot.attributes_for(:artwork)
          patch :update, params: { id: @artwork.id, artwork: artwork_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end

    context 'invalid input' do
      context 'html' do
        login_admin

        it 'rerenders the form' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          @artwork = @collection.artworks.sample
          artwork_attributes = FactoryBot.attributes_for(:artwork, :invalid)
          patch :update, params: { id: @artwork.id, artwork: artwork_attributes }
          expect(response).to render_template :edit
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          @artwork = @collection.artworks.sample
          artwork_attributes = FactoryBot.attributes_for(:artwork, :invalid)
          patch :update, params: { id: @artwork.id, artwork: artwork_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end
  end

end
