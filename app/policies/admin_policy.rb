class AdminPolicy < ApplicationPolicy
  def dashboard?
    return user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
