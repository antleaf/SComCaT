class AdminControllerPolicy < ApplicationPolicy
  attr_reader :user, :ctrlr

  def initialize(user, ctrlr)
    @user = user
    @ctrlr = ctrlr
  end

  def index?
    @user != nil && @user.has_role?(:admin)
  end

  def audit?
    @user != nil && @user.has_role?(:admin)
  end

end
