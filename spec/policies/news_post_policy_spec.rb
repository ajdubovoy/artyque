require 'rails_helper'

RSpec.describe NewsPostPolicy, type: :policy do
  let(:user) { create(:user, :unauthorized) }
  let(:scope) { Pundit.policy_scope!(user, Artist) }

  subject { described_class }

  permissions ".scope" do
    it "has a scope of all news posts" do
      expect(scope).to match_array NewsPost.all
    end
  end

  permissions :show? do
    it 'allows anyone' do
      user = create(:user)
      news_post = create(:news_post)
      expect(subject).to permit(user, news_post)
    end
  end

  permissions :new? do
    it 'allows admin' do
      user = create(:user, :admin)
      news_post = create(:news_post)
      expect(subject).to permit(user, news_post)
    end

    it 'denies not admin' do
      user = create(:user)
      news_post = create(:news_post)
      expect(subject).not_to permit(user, news_post)
    end
  end

  permissions :create? do
    it 'allows admin' do
      user = create(:user, :admin)
      news_post = create(:news_post)
      expect(subject).to permit(user, news_post)
    end

    it 'denies not admin' do
      user = create(:user)
      news_post = create(:news_post)
      expect(subject).not_to permit(user, news_post)
    end
  end

  permissions :edit? do
    it 'allows admin' do
      user = create(:user, :admin)
      news_post = create(:news_post)
      expect(subject).to permit(user, news_post)
    end

    it 'denies not admin' do
      user = create(:user)
      news_post = create(:news_post)
      expect(subject).not_to permit(user, news_post)
    end
  end

  permissions :update? do
    it 'allows admin' do
      user = create(:user, :admin)
      news_post = create(:news_post)
      expect(subject).to permit(user, news_post)
    end

    it 'denies not admin' do
      user = create(:user)
      news_post = create(:news_post)
      expect(subject).not_to permit(user, news_post)
    end
  end
end
