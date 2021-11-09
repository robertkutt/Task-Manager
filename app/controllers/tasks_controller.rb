class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@tasks)
  end

  def edit
    @edit_task = Task.find(params[:id])
  end

  def update
    @edit_task = Task.find(params[:id])
    @edit_task.update(task_params)
    redirect_to tasks_path(@tasks)
  end

   def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

   def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
