class CategoriesController < ApplicationController
  expose(:categories)
  expose(:category, attributes: :category_attributes)

  def index
  end

  def create
    if category.save
      redirect_to category_path(category)
    else
      render :new
    end
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
    if category.save
      redirect_to category_path(category)
    else
      render :edit
    end
  end

  def destroy
    if category.destroy
      redirect_to categories_path
    else
      render :index
    end
  end

  private 

  def category_attributes
    params.require(:category).permit(
      :name,
      :description,
      :percentage
    )
  end
end