class SchoolClassesController < ApplicationController

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(require_params(:title, :room_number))
        redirect_to school_class_path(@school_class)
    end

    def show
        @school_class = select_school_class
    end

    def edit
        @school_class = select_school_class
    end

    def update
        @school_class = SchoolClass.update(require_params(:title, :room_number))
        redirect_to school_class_path(@school_class)
    end

    private

    def select_school_class
        SchoolClass.find(params[:id])
    end

    def require_params(*args)
        params.require(:school_class).permit(*args)
    end
end