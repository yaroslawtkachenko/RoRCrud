class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
    respond_to do |format|
      format.html{}
      format.json{render :json => {tasks: @tasks}, status: :ok}
    end
  end

  def new

  end

  def create
    if current_user.tasks.create(task_create_params)
      respond_to do |format|
        format.html { redirect_to controller: :tasks}
        format.json { render json: @task, status: :ok}
      end
    else
      respond_to do |format|
        format.html { render 'tasks/new' }
        format.json { render json: @task, status: :unprocessable_entity}
      end
     end
  end

  def edit
   @task = Task.find_by(id: params[:id])
   # redirect_to '/'
   if @task
     respond_to do |format|
       format.html { redirect_to controller: :tasks}
       format.json { render json: @task, status: :ok}
     end
   else
     respond_to do |format|
       format.html { render 'tasks/edit' }
       format.json { render json: @task, status: :unprocessable_entity}
     end
   end
  end

  def update
    task = Task.find_by(id: params[:id])
    if task.update(task_update_params)
      respond_to do |format|
        format.html {redirect_to controller: :tasks}
        format.json { render json: task, status: :ok}
      end
    else
      respond_to do |format|
        format.html { render  'tasks/edit' }
        format.json { render json: task, status: :unprocessable_entity}
      end
    end
  end

  def delete
    task = Task.find_by(id: params[:id])
    if task && task.destroy
      respond_to do |format|
        format.html { redirect_to controller: :tasks}
        format.json { render json: task, status: :ok}
      end
    else
      respond_to do |format|
        format.html { redirect_to controller: :tasks}
        format.json { render json: task, status: :unprocessable_entity}
      end
    end
  end

  def task_create_params
    params.require(:task).permit(:name,:description,:importance,:expiry,:done)
  end

  def task_update_params
    params.require(:task).permit(:name,:description,:importance,:expiry,:done)
  end
end
