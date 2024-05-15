class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @q = current_user.categories.ransack(params[:q])
    @categories = @q.result(distinct: true)

    # @qt = curren_user.categories.ransack(params[:q])
    # @tasks = @qt.result(distinct: true)
    @tasks_for_today = current_user.tasks.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day)
  end

  def show
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = current_user.categories.build(category_params)

      if @category.save
        redirect_to category_url(@category), notice: "#{@category.name} was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

  def update
      if @category.update(category_params)
        redirect_to category_url(@category), notice: "#{@category.name} was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @category.destroy!
      redirect_to categories_url, notice: "#{@category.name} was successfully destroyed."
  end

  private
  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
