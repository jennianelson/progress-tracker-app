class StudentStandardsController < ApplicationController
    def new
        @standard = Standard.find(params[:standard_id])
        @student_standard = @standard.student_standards.build
    end
end