class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    @user != nil && @user.has_role?(:editor)
  end

  def new?
    create?
  end

  def update?
    @user != nil && @user.has_role?(:editor)
  end

  def edit?
    update?
  end

  def destroy?
    @user != nil && @user.has_role?(:admin)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
