class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completion_date)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(description: params[:task][:description], title: params[:task][:title], completion_date: params[:task][:completion_date]) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to tasks_path # go to the index so we can see the task in the list
    else # save failed :(
      render :new # show the new task form view again
    end
  end

  def edit
    @task = Task.find_by(id: params[:id].to_i)
  end

  def update
    #figure out how to simplify this
    @task = Task.find_by(id: params[:id].to_i)
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.completion_date = params[:task][:completion_date]

    # if @task.update_attributes(params[:task])
    #   redirect_to tasks_path
    # end
    # @task = Task.new(description: params[:task][:description], title: params[:task][:title], completion_date: params[:task][:completion_date]) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to tasks_path # go to the index so we can see the task in the list
    else # save failed :(
      render :edit # show the new task form view again
    end
  end

  def destroy
    Task.destroy(params[:id])
  end

end
