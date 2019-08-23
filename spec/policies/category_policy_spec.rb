require 'rails_helper'

RSpec.describe CategoryPolicy, type: :policy do
  let(:user) { create(:user, :unauthorized) }
  let(:scope) { Pundit.policy_scope!(user, Artist) }

  subject { described_class }

  permissions ".scope" do
    it "has a scope of all news posts" do
      expect(scope).to match_array Category.all
    end
  end

  permissions :new? do
    it 'allows admin' do
      user = create(:user, :admin)
      category = create(:category)
      expect(subject).to permit(user, category)
    end

    it 'denies not admin' do
      user = create(:user)
      category = create(:category)
      expect(subject).not_to permit(user, category)
    end
  end

  permissions :create? do
    it 'allows admin' do
      user = create(:user, :admin)
      category = create(:category)
      expect(subject).to permit(user, category)
    end

    it 'denies not admin' do
      user = create(:user)
      category = create(:category)
      expect(subject).not_to permit(user, category)
    end
  end

  permissions :edit? do
    it 'allows admin' do
      user = create(:user, :admin)
      category = create(:category)
      expect(subject).to permit(user, category)
    end

    it 'denies not admin' do
      user = create(:user)
      category = create(:category)
      expect(subject).not_to permit(user, category)
    end
  end

  permissions :update? do
    it 'allows admin' do
      user = create(:user, :admin)
      category = create(:category)
      expect(subject).to permit(user, category)
    end

    it 'denies not admin' do
      user = create(:user)
      category = create(:category)
      expect(subject).not_to permit(user, category)
    end
  end

  permissions :destroy? do
    it 'allows admin' do
      user = create(:user, :admin)
      category = create(:category)
      expect(subject).to permit(user, category)
    end

    it 'denies not admin' do
      user = create(:user)
      category = create(:category)
      expect(subject).not_to permit(user, category)
    end
  end
end
