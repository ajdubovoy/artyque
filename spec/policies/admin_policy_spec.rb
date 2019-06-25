require 'rails_helper'

RSpec.describe AdminPolicy, type: :policy do
  subject { described_class }
  permissions :dashboard? do
    it "denies access if user is not an admin" do
      user = create(:user, :unauthorized)
      expect(subject).not_to permit(user)
    end

    it "allows access if user is an admin" do
      user = create(:user, :admin)
      expect(subject).to permit(user)
    end
  end
end
