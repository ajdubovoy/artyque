class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def dashboard?
      return user.admin?
    end

    def resolve
      scope.all
    end
  end
end
