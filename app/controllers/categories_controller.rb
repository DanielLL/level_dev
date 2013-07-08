class CategoriesController < ApplicationController
  before_filter :authenticate_developer!
  before_filter :is_admin?, except: [:index, :show]
  expose(:categories)
  expose(:category, attributes: :category_attributes)
  expose(:developer) { Developer.find(params[:dev_id]) }
  expose(:skills) { category.skills.order('created_at asc') }

  # actions for the controller

  def index
  end

  def create
    save_update(:new)
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
    save_update(:edit)
  end

  def destroy
    if category.destroy
      redirect_to categories_path
    else
      render :index
    end
  end

  # methods

  def save_update(action)
    if category.valid_percentage?
      render action
    else
      if category.save
        redirect_to category_path(category)
      else
        render action
      end
    end
  end

  def is_admin?
    unless current_developer.admin?
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
