class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    @user.present? && user.admin?
  end

  def index?
      @user.present? && user.admin?
  end

  def create?
      @user.present? && user.admin?
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
