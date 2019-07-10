require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
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
end
