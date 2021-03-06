require 'rails_helper'

RSpec.describe ArtworkPolicy, type: :policy do
  let(:user) { User.new }

  subject { described_class }

  permissions :new? do
    it "allows access if the user is an admin" do
      user = create(:user, :admin)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "allows access if the user controls the artist" do
      user = create(:user, :artist)
      artist = create(:artist)
      artist.user = user
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "does not allow access if the user does not control the artist" do
      user = create(:user, :artist)
      user2 = create(:user, :artist)
      artist = create(:artist)
      artist.user = user2
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end

    it "does not allow access if the user is unauthorized" do
      user = create(:user, :unauthorized)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end
  end

  permissions :create? do
    it "allows access if the user is an admin" do
      user = create(:user, :admin)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "allows access if the user controls the artist" do
      user = create(:user, :artist)
      artist = create(:artist)
      artist.user = user
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "does not allow access if the user does not control the artist" do
      user = create(:user, :artist)
      user2 = create(:user, :artist)
      artist = create(:artist)
      artist.user = user2
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end

    it "does not allow access if the user is unauthorized" do
      user = create(:user, :unauthorized)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end
  end

  permissions :edit? do
    it "allows access if the user is an admin" do
      user = create(:user, :admin)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "allows access if the user controls the artist" do
      user = create(:user, :artist)
      artist = create(:artist)
      artist.user = user
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "does not allow access if the user does not control the artist" do
      user = create(:user, :artist)
      user2 = create(:user, :artist)
      artist = create(:artist)
      artist.user = user2
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end

    it "does not allow access if the user is unauthorized" do
      user = create(:user, :unauthorized)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end
  end

  permissions :update? do
    it "allows access if the user is an admin" do
      user = create(:user, :admin)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "allows access if the user controls the artist" do
      user = create(:user, :artist)
      artist = create(:artist)
      artist.user = user
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "does not allow access if the user does not control the artist" do
      user = create(:user, :artist)
      user2 = create(:user, :artist)
      artist = create(:artist)
      artist.user = user2
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end

    it "does not allow access if the user is unauthorized" do
      user = create(:user, :unauthorized)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end
  end

  permissions :destroy? do
    it "allows access if the user is an admin" do
      user = create(:user, :admin)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "allows access if the user controls the artist" do
      user = create(:user, :artist)
      artist = create(:artist)
      artist.user = user
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).to permit(user, artwork)
    end

    it "does not allow access if the user does not control the artist" do
      user = create(:user, :artist)
      user2 = create(:user, :artist)
      artist = create(:artist)
      artist.user = user2
      artist.save
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end

    it "does not allow access if the user is unauthorized" do
      user = create(:user, :unauthorized)
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      expect(subject).not_to permit(user, artwork)
    end
  end
end
