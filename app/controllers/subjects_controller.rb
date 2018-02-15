class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    def index
        @subjects = Subject.all
    end

    def show
    end

    def new
        # binding.pry
        @subject = Subject.new
        subjects = parse_api("jurisdictions", "B838B98D043045748F3814B9E43CAC85")["data"]["standardSets"]
        # @subjects_array = subjects.map do |s|
        #      { title: s["title"] + s["subject"],
        #         set_id: s["id"] }
        # end
        @subjects_array = subjects.map { |s| [ s["title"] + " " + s["subject"], s["id"] ] }
        
    end

    def create
        @subject = Subject.new(subject_params)
    end

    def edit
    end

    def update
        authorize @subject
        if @subject.update(subject_params)
            redirect_to subject_path(@subject)
        else
            render :edit
        end
    end

    # def destroy
    #     student_subject = current_user.student_subjects.find {|ss| ss.subject == @subject}
    #     # StudentStandard.find_and_destroy(@subject.sections)
    #     student_subject.destroy
    #     redirect_to subjects_path
    # end

    private

    def subject_params
        params.require(:subject).permit(:title, :set_id, sections_attributes: [:title])
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end
end
