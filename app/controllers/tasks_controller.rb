class TasksController < ApplicationController
    before_action :set_task, only: [:show]
    
    def index
        @tasks = Task.all
        render json: @tasks
    end
    
    def show
        render json: @task
    end

    def create
        @task = Task.new()
        title = task_params["title"]
        content = task_params["content"]
        @task.title = title
        @task.content = content
        p @task
        if @task.save
            render json: @task, status: :created, location: @task
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @task.destroy
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :content)
    end
end
