class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(params[:category].permit(:name, :description, :percentage))
    if @category.save
      redirect_to action: :show, id: @category.id
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params[:category].permit(:name))
      redirect_to action: :show, id: @category.id
    else
      render :edit
    end
  end

end
