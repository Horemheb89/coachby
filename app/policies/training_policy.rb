class TrainingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.is_coach
  end

  def show?
    true
  end

  def index?
    #user.coach
    true
  end
end
