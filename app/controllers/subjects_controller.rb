class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    def index
        @subjects = Subject.order(:set_id)
        if params["subjects"].present?
            subject = Subject.find(params["subjects"])
            redirect_to subject_path(subject)
        end
    end

    def show
    end

    def new
        @subject = Subject.new
        subjects_from_csp = csp_data("jurisdictions", "B838B98D043045748F3814B9E43CAC85").get_subjects
        @subjects_not_added = Subject.not_added(subjects_from_csp).sort_by {|s| s[1]}
        5.times { @subject.sections.build }
    end

    def create
        @subject = Subject.new(subject_params)
        authorize @subject
        if @subject.save
            redirect_to subject_path(@subject)
            flash[:alert] = "Subject created successfully!"
        else
            render :new
        end
    end

    def edit
        2.times { @subject.sections.build }
        standards_from_csp = csp_data("standard_sets", @subject.set_id).get_standards
        standards_not_added = @subject.standards_not_added(standards_from_csp)
        @new_standards = @subject.build_new_standards(standards_not_added)
    end

    def update
        authorize @subject
        readiness = @subject.ready
        if @subject.update(subject_params)
            if @subject.ready != readiness
                redirect_to subject_path(@subject)
            else
                redirect_to edit_subject_path(@subject)
            end
            flash[:alert] = "Updated successfully!"
        else
            render :edit
        end
    end

    def destroy
        authorize @subject
        @subject.destroy
        redirect_to subjects_path
    end

    private

    def subject_params
        params.require(:subject).permit(:ready, :title, :set_id, sections_attributes: [:title, :id, :subject_id], standards_attributes: [:description, :dot_notation, :section_id, :asn_id])
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end

    def csp_data(resource, set_id)
        GetCommonStandards.new(resource, set_id)
    end

end