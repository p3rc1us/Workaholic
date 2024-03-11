class TasksController < ApplicationController
  before_action :set_category, only: %i[ new edit create update destroy]
  before_action :set_task, only: %i[ show edit update destroy]

  def index
    @tasks = current_user.tasks.all
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category), notice: "#{@task.name} was successfully created."
    else
      render :form
    end

  end

  def update
    if edit
      if @task.update(task_params)
        redirect_to category_path(@category), notice: "#{@task.name} was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @task.destroy!
      redirect_to category_path(@category), notice: "#{@task.name} was successfully destroyed."
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task =  @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :category_id, :completed)
  end
end
