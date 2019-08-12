require 'rails_helper'

RSpec.describe Video, type: :model do
  describe '#vimeo?' do
    it 'returns true when link is vimeo' do
      artist = create(:artist)
      video = create(:video, artwork: artist.artworks.sample)
      actual = video.vimeo?
      expect(actual).to be true
    end

    it 'returns false when link is youtube' do
      artist = create(:artist)
      video = create(:video, :youtube, artwork: artist.artworks.sample)
      actual = video.vimeo?
      expect(actual).to be false
    end
  end

  describe '#youtube?' do
    it 'returns false when link is vimeo' do
      artist = create(:artist)
      video = create(:video, artwork: artist.artworks.sample)
      actual = video.youtube?
      expect(actual).to be false
    end

    it 'returns true when link is youtube' do
      artist = create(:artist)
      video = create(:video, :youtube, artwork: artist.artworks.sample)
      actual = video.youtube?
      expect(actual).to be true
    end
  end

  describe '#type' do
    it 'returns vimeo when link is vimeo' do
      artist = create(:artist)
      video = create(:video, artwork: artist.artworks.sample)
      actual = video.type
      expect(actual).to be :vimeo
    end

    it 'returns youtube when link is youtube' do
      artist = create(:artist)
      video = create(:video, :youtube, artwork: artist.artworks.sample)
      actual = video.type
      expect(actual).to be :youtube
    end
  end
end
