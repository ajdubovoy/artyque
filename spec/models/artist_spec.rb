require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe '#vimeo?' do
    it 'returns true when link is vimeo' do
      artist = create(:artist, video: 'https://vimeo.com/167566292')
      actual = artist.vimeo?
      expect(actual).to be true
    end

    it 'returns false when link is youtube' do
      artist = create(:artist, video: 'https://www.youtube.com/watch?v=THPREWK64xI')
      actual = artist.vimeo?
      expect(actual).to be false
    end
  end
end
