require 'rails_helper'

RSpec.describe ResumeBlocksController, type: :controller do
  describe '#index' do
    it 'renders the right template' do
      @artist = create(:artist)
      get :index, params: { artist_id: @artist.id }
      expect(response).to render_template :index
    end

    it 'selects the correct artist and blocks' do
      @artist = create(:artist)
      get :index, params: { artist_id: @artist.id }
      expect(assigns(:artist)).to be_instance_of Artist
      expect(assigns(:artist)).to eq @artist
      expect(assigns(:blocks)).to eq @artist.blocks
    end

    context 'xhr for modal' do
      it 'renders a partial for modal' do
        @artist = create(:artist)
        get :index, params: { artist_id: @artist.id }, xhr: true
        expect(JSON.parse(response.body).has_key? 'html').to be true
      end
    end
  end
end
