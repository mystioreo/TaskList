require 'date'

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(completion_date: :desc)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id].to_i)
  end

  def update
    @task = Task.find_by(id: params[:id].to_i)
    if @task.update(task_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if Task.destroy(params[:id].to_i)
      redirect_to root_path
    end
  end

  def mark_complete
    @task = Task.find_by(id: params[:id].to_i)
    @task.completion_date = Date.today
    if @task.save
       redirect_to root_path
    end
  end

  def undo_mark_complete
    @task = Task.find_by(id: params[:id].to_i)
    @task.completion_date = nil
    if @task.save
      redirect_to root_path
    end
  end

  private

  def task_params
    return params.require(:task).permit(:title, :description)
  end

end
