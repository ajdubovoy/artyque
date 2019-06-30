require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do
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
          expect(response).to redirect_to edit_collections_artist_path(@artist)
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
end
