class StandardPolicy < ApplicationPolicy
    attr_reader :user, :standard
    
    def initialize(user, standard)
        @user = user
        @standard = standard
    end

    def update?
        user.teacher? || user.admin?
    end

    def destroy?
        user.admin?
    end
end