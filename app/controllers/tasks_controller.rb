class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def new

  end

  def create
    current_user.tasks.create(task_create_params)
    redirect_to '/'
  end

  def edit
   @task = Task.find_by(id: params[:id])
    unless @task
      redirect_to '/'
    end
  end

  def update
    task = Task.find_by(id: params[:id])
    if task && params[:task]
      task.update!(task_update_params)
    end
    redirect_to '/'
  end

  def delete
    task = Task.find_by(id: params[:id])
    if task
      task.destroy!
    end
    redirect_to '/'
  end

  def task_create_params
    params.require(:task).permit(:name,:description)
  end

  def task_update_params
    params.require(:task).permit(:name,:description)
  end
end
