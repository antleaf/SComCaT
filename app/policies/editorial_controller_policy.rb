class EditorialControllerPolicy < ApplicationPolicy
  attr_reader :user, :ctrlr

  def initialize(user, ctrlr)
    @user = user
    @ctrlr = ctrlr
  end

  def index?
    @user != nil && @user.has_role?(:editor)
  end

end
