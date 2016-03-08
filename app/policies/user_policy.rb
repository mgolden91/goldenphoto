class UserPolicy < ApplicationPolicy
  attr_reader :user, :current_user

  def initialize(user, current_user)
    @user = user
    @current_user = current_user
  end

  def new?
    @user.present? && @user.admin?
  end

  def index?
    @user.present? && @user.admin?
  end

  def show?
    @user.present? && @user.id == @current_user.id || @user.admin?
  end

  def edit?
    @user.present? && @user.admin?
  end

  def update?
    @user.present? && @user.admin?
  end

  def create?
    @user.present? && @user.admin?
  end

  def destroy?
    @user.present? && @user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
