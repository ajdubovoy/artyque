require 'rails_helper'

RSpec.describe ArtistPolicy, type: :policy do
  let(:user) { create(:user, :unauthorized) }
  let(:scope) { Pundit.policy_scope!(user, Artist) }

  subject { described_class }

  permissions ".scope" do
    it "has a scope of all artists" do
      expect(scope).to eq Artist.all
    end
  end
end
