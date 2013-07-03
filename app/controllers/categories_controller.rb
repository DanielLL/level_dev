class CategoriesController < ApplicationController
  before_filter :authenticate_developer!
  expose(:categories)
  expose(:category, attributes: :category_attributes)

  def index
  end

  def create
    if current_developer.admin
      if category.save
        redirect_to category_path(category)
      else
        render :new
      end
    else
      redirect_to categories_path
    end
  end

  def new
    if current_developer.admin
      render :new
    else
      redirect_to categories_path
    end
  end

  def show
  end

  def edit
    if current_developer.admin
      render :new
    else
      redirect_to categories_path
    end
  end

  def update
    if current_developer.admin
      if category.save
        redirect_to category_path(category)
      else
        render :edit
      end
    else
      redirect_to categories_path
    end
  end

  def destroy
    if current_developer.admin
      if category.destroy
        redirect_to categories_path
      else
        render :index
      end
    else
      redirect_to categories_path
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
