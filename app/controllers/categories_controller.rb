class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def create
    @category.new(params[:category].permit(:name))
    if @category.save
      redirect_to action: :show, id: @category.id
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end
end
