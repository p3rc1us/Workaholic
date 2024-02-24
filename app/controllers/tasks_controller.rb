class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.create(task_params)
    redirect_to category_path(@category)
  end

  def update
    if edit
      respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to category_path(@category), notice: "Task was successfully updated." }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
      end
    end
  end

  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: "Task was successfully destroyed." }
    end
  end

  private

  def set_task
    @task =  Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :category_id)
  end
end
