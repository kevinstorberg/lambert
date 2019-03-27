class ServiceAreaPolicy < ApplicationPolicy

  def index?
    user.any_admin?
  end

  def show?
    user.any_admin?
  end

  def new?
    user.any_admin?
  end

  def create?
    new?
  end

  def edit?
    user.any_admin?
  end

  def update?
    edit?
  end

  def destroy?
    user.any_admin?
  end
end
