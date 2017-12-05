class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
    respond_to do |format|
      format.html {  }
      format.json { render json: @tasks, status: :ok}
    end
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      respond_to do |format|
        format.html { redirect_to controller: :tasks }
        format.json { render json: @task, status: :ok}
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @task, status: :unprocessable_entity}
      end
    end
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to controller: :tasks }
        format.json { render json: @task, status: :ok}
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @task, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    if @task && @task.destroy
      respond_to do |format|
        format.html { redirect_to controller: :tasks}
        format.json { render json: @task, status: :ok}
      end
    else
      respond_to do |format|
        format.html { redirect_to controller: :tasks}
        format.json { render json: @task, status: :unprocessable_entity}
      end
    end
  end

  private

  def set_list
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :expiry, :importance, :is_done)
  end
end
