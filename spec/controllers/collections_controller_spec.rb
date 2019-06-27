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
        expect(assigns(:collection)).to eq @collection
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
end
