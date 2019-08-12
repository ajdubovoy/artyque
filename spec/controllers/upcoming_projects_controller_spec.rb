require 'rails_helper'

RSpec.describe UpcomingProjectsController, type: :controller do
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

      it 'makes a new upcoming_project' do
        @artist = create(:artist)
        @upcoming_project = UpcomingProject.new
        get :new, params: { artist_id: @artist.id }
        expect(assigns(:upcoming_project)).to be_instance_of UpcomingProject
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

        it 'redirects to the edit upcoming_projects page' do
          @artist = create(:artist)
          upcoming_project_attributes = FactoryBot.attributes_for(:upcoming_project)
          post :create, params: { artist_id: @artist.id, upcoming_project: upcoming_project_attributes }
          expect(response).to redirect_to edit_artist_path(@artist, stage: :upcoming_projects)
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          upcoming_project_attributes = FactoryBot.attributes_for(:upcoming_project)
          post :create, params: { artist_id: @artist.id, upcoming_project: upcoming_project_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end

    context 'invalid input' do
      context 'html' do
        login_admin

        it 'rerenders the form' do
          @artist = create(:artist)
          upcoming_project_attributes = FactoryBot.attributes_for(:upcoming_project, :invalid)
          post :create, params: { artist_id: @artist.id, upcoming_project: upcoming_project_attributes }
          expect(response).to render_template :new
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          upcoming_project_attributes = FactoryBot.attributes_for(:upcoming_project, :invalid)
          post :create, params: { artist_id: @artist.id, upcoming_project: upcoming_project_attributes, format: :js }
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
        @upcoming_project = @artist.upcoming_projects.sample
        get :edit, params: { id: @upcoming_project.id }
        expect(response).to render_template :edit
      end

      it 'selects the correct upcoming_project' do
        @artist = create(:artist)
        @upcoming_project = @artist.upcoming_projects.sample
        get :edit, params: { id: @upcoming_project.id }
        expect(assigns(:upcoming_project)).to be_instance_of UpcomingProject
        expect(assigns(:upcoming_project)).to eq @upcoming_project
      end
    end

    context 'js' do
      login_admin

      it 'renders the right template' do
        @artist = create(:artist)
        @upcoming_project = @artist.upcoming_projects.sample
        get :edit, params: { id: @upcoming_project.id }
        expect(response).to render_template :edit
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#update' do
    context 'valid input' do
      context 'html' do
        login_admin

        it 'redirects to the edit upcoming_projects page' do
          @artist = create(:artist)
          @upcoming_project = @artist.upcoming_projects.sample
          upcoming_project_attributes = FactoryBot.attributes_for(:upcoming_project)
          patch :update, params: { id: @upcoming_project.id, upcoming_project: upcoming_project_attributes }
          expect(response).to redirect_to edit_artist_path(@artist, stage: :upcoming_projects)
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @upcoming_project = @artist.upcoming_projects.sample
          upcoming_project_attributes = FactoryBot.attributes_for(:upcoming_project)
          patch :update, params: { id: @upcoming_project.id, upcoming_project: upcoming_project_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end

    context 'invalid input' do
      context 'html' do
        login_admin

        it 'rerenders the form' do
          @artist = create(:artist)
          @upcoming_project = @artist.upcoming_projects.sample
          upcoming_project_attributes = FactoryBot.attributes_for(:upcoming_project, :invalid)
          patch :update, params: { id: @upcoming_project.id, upcoming_project: upcoming_project_attributes }
          expect(response).to render_template :edit
        end
      end

      context 'js' do
        login_admin

        it 'returns a successful response' do
          @artist = create(:artist)
          @upcoming_project = @artist.upcoming_projects.sample
          upcoming_project_attributes = FactoryBot.attributes_for(:upcoming_project, :invalid)
          patch :update, params: { id: @upcoming_project.id, upcoming_project: upcoming_project_attributes, format: :js }
          expect(response.status).to eq(200)
        end
      end
    end
  end

  describe '#destroy' do
    context 'html' do
      login_admin

      it 'redirects to the edit upcoming_projects page' do
        @artist = create(:artist)
        @upcoming_project = @artist.upcoming_projects.sample
        delete :destroy, params: { id: @upcoming_project.id }
        expect(response).to redirect_to edit_artist_path(@artist, stage: :upcoming_projects)
      end

      it 'destroys the upcoming_project' do
        @artist = create(:artist)
        @upcoming_project = @artist.upcoming_projects.sample
        delete :destroy, params: { id: @upcoming_project.id }
        expect(UpcomingProject.exists? @upcoming_project.id).to be false
      end
    end

    context 'js' do
      login_admin

      it 'returns a successful response' do
        @artist = create(:artist)
        @upcoming_project = @artist.upcoming_projects.sample
        delete :destroy, params: { id: @upcoming_project.id }, format: :js
        expect(response.status).to eq(200)
      end
    end
  end
end
