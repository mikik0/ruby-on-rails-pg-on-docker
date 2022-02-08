class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = Task.search(params[:keyword])
        @keyword = params[:keyword]
        render json: @tasks
    end
    
    def show
        render json: @task
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            render json: @task, status: :created, location: @task
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    def update
        if @task.update(task_params)
            render json: @task, status: :created, location: @task
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @task.destroy
            render json: @task, status: :no_content
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :content)
    end
end
