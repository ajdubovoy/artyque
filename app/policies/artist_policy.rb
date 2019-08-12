class ArtistPolicy < ApplicationPolicy
  def new?
    return user.admin?
  end

  def create?
    return new?
  end

  def show?
    return edit?
  end

  def edit?
    return user && (user.admin? || record.user == user)
  end

  def update?
    return edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
