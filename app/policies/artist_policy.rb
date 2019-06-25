class ArtistPolicy < ApplicationPolicy
  def edit?
    return user && (user.admin? || record.user == user)
  end

  def layout?
    return edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
