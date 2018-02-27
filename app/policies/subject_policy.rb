class SubjectPolicy < ApplicationPolicy
    attr_reader :user, :subject

    def initialize(user, subject)
        @user = user
        @subject = subject
    end

    def new?
        user.teacher? || user.admin?
    end

    def create?
        user.teacher? || user.admin?
    end

    def edit?
        user.teacher? || user.admin?
    end

    def update?
        user.teacher? || user.admin?
    end

    def destroy?
        user.teacher? || user.admin?
    end

end