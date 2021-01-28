class TechnologyPolicy < ApplicationPolicy
  def change_slug_id?
    @user != nil && @user.has_role?(:admin)
  end
end
