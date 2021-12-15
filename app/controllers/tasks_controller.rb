class TasksController < ApplicationController
    before_action :set_task, only: [:show]
    
    def index
        @tasks = Task.all
        render json: @tasks
    end
    
    def show
        render json: @task
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end
end
