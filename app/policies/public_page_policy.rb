class PublicPagePolicy < ApplicationPolicy

  def index?
    user.any_admin?
  end

  def edit?
    update?
  end

  def update?
    user.any_admin?
  end
end
