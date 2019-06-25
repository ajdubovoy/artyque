require 'rails_helper'

RSpec.describe AdminPolicy, type: :policy do
  subject { described_class.new(user, nil) }

  context 'for an admin' do
    let(:user) { create(:user, :admin) }
    it { is_expected.to permit_action(:dashboard) }
  end

  context 'for anyone else' do
    let(:user) { create(:user, :unauthorized) }
    it { is_expected.to forbid_action(:dashboard) }
  end
end
