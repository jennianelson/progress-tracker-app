class StudentStandardPolicy < ApplicationPolicy
    attr_reader :user, :student_standard
    
    def initialize(user, student_standard)
        @user = user
        @student_standard = student_standard
    end

    def show?
       user.teacher? || user.admin? || student_standard.user == user
    end

    def update?
        student_standard.user == user
    end

end