class StandardsController < ApplicationController
    before_action :set_standard

    def edit
        @subject = @standard.subject
    end

    def update
        if @standard.update(standard_params)
            redirect_to subject_path(@standard.subject)
        else
            render :edit
        end
    end

    def destroy
        @standard.destroy
        redirect_to subject_path(@standard.subject)
    end

    private

    def standard_params
        params.require(:standard).permit(:description, :dot_notation, :section_id, :asn_id)
    end

    def set_standard
        @standard = Standard.find(params[:id])
    end

end
