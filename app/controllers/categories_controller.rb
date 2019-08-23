class CategoriesController < ApplicationController
  include MarkdownHelper
  before_action :set_category, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show]
  after_action :skip_authorization, only: %i[show]

  def new
    @category = Category.new
    authorize_category
  end

  def create
    @category = Category.new(category_params)
    authorize_category
    if @category.save
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def edit
    authorize_category
  end

  def update
    authorize_category
    if @category.update(category_params)
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  def destroy
    authorize_category
    if @category.destroy
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def authorize_category
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
