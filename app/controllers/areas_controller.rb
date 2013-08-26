class AreasController < ApplicationController
  before_filter :authenticate_developer!
  before_filter :is_admin?, except: [:index, :show]
  expose(:areas)
  expose(:area, attributes: :area_attributes)
  expose(:developer) { Developer.find(params[:dev_id]) }
  expose(:skills) { area.skills.order('created_at asc') }

  # actions for the controller

  def create
    save_update(:new)
  end

  def update
    save_update(:edit)
  end

  def destroy
    if area.destroy
      redirect_to areas_path
    else
      render :index
    end
  end

  # methods

  def save_update(action)
    if area.valid_percentage? && area.save
      redirect_to area_path(area)
    else
      render action
    end
  end

  def is_admin?
    redirect_to areas_path if !current_developer.admin?
  end

  private 

  def area_attributes
    params.require(:area).permit(
      :name,
      :description,
      :percentage
    )
  end
end
