class ArtworkPolicy < ApplicationPolicy
  def new?
    return user && (user.admin? || record.collection.artist.user == user)
  end

  def create?
    return new?
  end

  def edit?
    return new?
  end

  def update?
    return new?
  end

  def destroy?
    return new?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
