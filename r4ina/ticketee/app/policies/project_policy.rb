class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    # two instance vars for the class
    # @user and @record
    # for example, @record could be Project
    # then Project must has_many :roles
    user.try(:admin?) || record.roles.exists?(user_id: user)
    # user might be nil (not logged in)
  end
end
