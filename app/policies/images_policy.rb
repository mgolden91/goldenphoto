class ImagesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
