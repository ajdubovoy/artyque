require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do
  describe '#index' do
    it 'renders the right template' do
      @artist = create(:artist)
      get :index, params: { artist_id: @artist.id }
      expect(response).to render_template :index
    end

    it 'selects the correct collections' do
      @artist = create(:artist)
      get :index, params: { artist_id: @artist.id }
      expect(assigns(:collections)).to match_array @artist.collections
    end

    context 'xhr for modal' do
      it 'renders a partial for modal' do
        @artist = create(:artist)
        get :index, params: { artist_id: @artist.id }, xhr: true
        expect(JSON.parse(response.body).has_key? 'html').to be true
      end
    end
  end

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

      it 'makes a new collection' do
        @artist = create(:artist)
        @collection = Collection.new
        get :new, params: { artist_id: @artist.id }
        expect(assigns(:collection)).to be_instance_of Collection
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

        it 'redirects to the edit collections page' do
          @artist = create(:artist)
          collection_attributes = FactoryBot.attributes_for(:collection)
          post :create, params: { artist_id: @artist.id, collection: collection_attributes }
          expect(response).to redirect_to edit_artist_path(@artist, stage: :artworks)
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          collection_attributes = FactoryBot.attributes_for(:collection)
          post :create, params: { artist_id: @artist.id, collection: collection_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end

    context 'invalid input' do
      context 'html' do
        login_admin

        it 'rerenders the form' do
          @artist = create(:artist)
          collection_attributes = FactoryBot.attributes_for(:collection, :invalid)
          post :create, params: { artist_id: @artist.id, collection: collection_attributes }
          expect(response).to render_template :new
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          collection_attributes = FactoryBot.attributes_for(:collection, :invalid)
          post :create, params: { artist_id: @artist.id, collection: collection_attributes, format: :js }
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
        get :edit, params: { id: @collection.id }
        expect(response).to render_template :edit
      end

      it 'selects the correct collection' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        get :edit, params: { id: @collection.id }
        expect(assigns(:collection)).to be_instance_of Collection
        expect(assigns(:collection)).to eq @collection
      end
    end

    context 'js' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        get :edit, params: { id: @collection.id }
        expect(response).to render_template :edit
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#update' do
    context 'valid input' do
      context 'html' do
        login_admin

        it 'redirects to the edit collections page' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          collection_attributes = FactoryBot.attributes_for(:collection)
          patch :update, params: { id: @collection.id, collection: collection_attributes }
          expect(response).to redirect_to edit_artist_path(@artist, stage: :artworks)
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          collection_attributes = FactoryBot.attributes_for(:collection)
          patch :update, params: { id: @collection.id, collection: collection_attributes, format: :js }
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
          collection_attributes = FactoryBot.attributes_for(:collection, :invalid)
          patch :update, params: { id: @collection.id, collection: collection_attributes }
          expect(response).to render_template :edit
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @collection = @artist.collections.sample
          collection_attributes = FactoryBot.attributes_for(:collection, :invalid)
          patch :update, params: { id: @collection.id, collection: collection_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end
  end

  describe '#destroy' do
    context 'html' do
      login_admin

      it 'redirects to the edit collections page' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        delete :destroy, params: { id: @collection.id }
        expect(response).to redirect_to edit_artist_path(@artist, stage: :artworks)
      end

      it 'destroys the collection' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        delete :destroy, params: { id: @collection.id }
        expect(Collection.exists? @collection.id).to be false
      end
    end

    context 'js' do
      login_admin

      it 'returns a successful response' do
        @artist = create(:artist)
        @collection = @artist.collections.sample
        delete :destroy, params: { id: @collection.id }, format: :js
        expect(response.status).to eq(200)
      end
    end
  end
end
