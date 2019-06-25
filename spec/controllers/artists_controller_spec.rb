require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  describe '#edit' do
    context 'html' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        get :edit, params: { id: @artist.id }
        expect(response).to render_template :edit
      end

      it 'selects the correct artist' do
        @artist = create(:artist)
        get :edit, params: { id: @artist.id }
        expect(assigns(:artist)).to be_instance_of Artist
        expect(assigns(:artist)).to eq @artist
      end
    end

    context 'js' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        get :edit, params: { id: @artist.id }
        expect(response).to render_template :edit
        expect(response.status).to eq(200)
      end
    end
  end
end
