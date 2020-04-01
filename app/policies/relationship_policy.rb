class RelationshipPolicy < ApplicationPolicy

  def index?
    @user != nil && @user.has_role?(:editor)
  end

end
