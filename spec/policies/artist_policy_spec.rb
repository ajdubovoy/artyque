require 'rails_helper'

RSpec.describe ArtistPolicy, type: :policy do
  let(:user) { create(:user, :unauthorized) }
  let(:scope) { Pundit.policy_scope!(user, Artist) }

  subject { described_class }

  permissions :edit? do
    it "allows access if the user is an admin" do
      user = create(:user, :admin)
      artist = create(:artist)
      expect(subject).to permit(user, artist)
    end

    it "allows access if the user controls the artist" do
      user = create(:user, :artist)
      artist = create(:artist)
      artist.user = user
      artist.save
      expect(subject).to permit(user, artist)
    end

    it "does not allow access if the user does not control the artist" do
      user = create(:user, :artist)
      user2 = create(:user, :artist)
      artist = create(:artist)
      artist.user = user2
      artist.save
      expect(subject).not_to permit(user, artist)
    end

    it "does not allow access if the user is unauthorized" do
      user = create(:user, :unauthorized)
      artist = create(:artist)
      expect(subject).not_to permit(user, artist)
    end
  end

  permissions :layout? do
    it "allows access if the user is an admin" do
      user = create(:user, :admin)
      artist = create(:artist)
      expect(subject).to permit(user, artist)
    end

    it "allows access if the user controls the artist" do
      user = create(:user, :artist)
      artist = create(:artist)
      artist.user = user
      artist.save
      expect(subject).to permit(user, artist)
    end

    it "does not allow access if the user does not control the artist" do
      user = create(:user, :artist)
      user2 = create(:user, :artist)
      artist = create(:artist)
      artist.user = user2
      artist.save
      expect(subject).not_to permit(user, artist)
    end

    it "does not allow access if the user is unauthorized" do
      user = create(:user, :unauthorized)
      artist = create(:artist)
      expect(subject).not_to permit(user, artist)
    end
  end

  permissions ".scope" do
    it "has a scope of all artists" do
      expect(scope).to eq Artist.all
    end
  end
end
