class NewsPostPolicy < ApplicationPolicy
  def show?
    return true
  end

  def new?
    return user.admin?
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

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
