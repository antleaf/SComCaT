class UserPolicy < ApplicationPolicy

  def index?
    @user != nil && @user.has_role?(:admin)
  end

  def show?
    @user != nil && @user.has_role?(:admin)
  end

  def create?
    @user != nil && @user.has_role?(:admin)
  end

  def update?
    @user != nil && @user.has_role?(:admin)
  end
end
