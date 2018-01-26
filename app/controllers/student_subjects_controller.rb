class StudentSubjectsController < ApplicationController
    
    def new
        @student_subject = StudentSubject.new
        @subjects = Subject.all
    end

    def create
        @student_subject = current_user.student_subjects.build(student_subject_params)
        if @student_subject.save

        # Move this to an instance method in StudentSubject Model
            @student_subject.sections.each do |section|
                section.standards.each do |standard|
                    current_user.student_standards.create(standard_id: standard.id)
                end
            end
        # ----
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def student_subject_params
        params.require(:student_subject).permit(:subject_id)
    end
end
