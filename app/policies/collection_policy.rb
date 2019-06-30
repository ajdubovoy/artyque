class CollectionPolicy < ApplicationPolicy
  def new?
    return user && (user.admin? || record.artist.user == user)
  end

  def create?
    return new?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
