class HomePageQuotationPolicy < ApplicationPolicy
  def edit?
    return user.admin?
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
