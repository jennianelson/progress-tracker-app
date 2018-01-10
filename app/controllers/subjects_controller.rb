class SubjectsController < ApplicationController
    def index
    end

    def show
        @subject = Subject.find(params[:id])
    end
end
