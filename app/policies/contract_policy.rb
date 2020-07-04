class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(coach_id: user.id)
    end
  end

  def create?
    user.is_coach
  end

  def show?
    user == record.coach || user == record.athlete
  end

  def index?
    user.coach
  end
end
