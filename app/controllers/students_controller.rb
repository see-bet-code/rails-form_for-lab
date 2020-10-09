class StudentsController < ApplicationController

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(require_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end

    def show
        @student = select_student
    end

    def edit
        @student = select_student
    end

    def update
        @student = Student.update(require_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end

    private

    def select_student
        Student.find(params[:id])
    end

    def require_params(*args)
        params.require(:student).permit(*args)
    end
end