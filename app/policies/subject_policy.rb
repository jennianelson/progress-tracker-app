class SubjectPolicy < ApplicationPolicy
    attr_reader :user, :subject

    def initialize(user, subject)
        @user = user
        @subject = subject
    end

    
end