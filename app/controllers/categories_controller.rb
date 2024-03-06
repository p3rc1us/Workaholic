class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    if user_signed_in?
      @categories = current_user.categories
      @tasks_for_today = current_user.tasks.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day)
    else
      redirect_to new_user_session_path
    end
    puts @tasks_for_today.count
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

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
