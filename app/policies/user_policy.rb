class UserPolicy < ApplicationPolicy

  def index?
    user.any_admin?
  end

  def show?
    user.any_admin? || user == record
  end

  def new?
    user.any_admin?
  end

  def create?
    new?
  end

  def edit?
    user.any_admin? || user == record
  end

  def update?
    edit?
  end

  def destroy?
    user.any_admin?
  end

  # ============================================================================
  def edit_password?
    user.any_admin? || user == record
  end

  def update_password?
    edit_password?
  end
end
