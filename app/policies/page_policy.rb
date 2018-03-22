class PagePolicy < ApplicationPolicy

  def destroy?
    user.is_sysop?
  end

  def create?
    user.is_sysop?
  end

  def edit?
    @record.editable? || user.is_sysop?
  end

end