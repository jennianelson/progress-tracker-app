class StudentSubjectPolicy < ApplicationPolicy
    attr_reader :user, :student_subject
    
    def initialize(user, student_subject)
        @user = user
        @student_subject = student_subject
    end

    def show?
        user.teacher? || student_subject.user == user 
    end

end