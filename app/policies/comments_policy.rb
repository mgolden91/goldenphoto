class CommentsPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    @user.present?
  end

  def create?
    @user.present?
  end

  def destroy?
    @user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
