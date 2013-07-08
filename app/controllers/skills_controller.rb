class SkillsController < ApplicationController
  before_filter :authenticate_developer!
  before_filter :is_admin?, except: :index
  expose(:category)
  expose(:skills)
  expose(:skill, attributes: :skill_attributes)

  def index
  end

  def new
  end

  def create
    save_update(:new)
  end

  def destroy
    if skill.destroy
      redirect_to category_path(skill.category)
    else
      redirect_to category_path(skill.category)
    end
  end

  def edit
  end

  def update
    save_update(:edit)
  end

  def save_update(action)
    if skill.save
      redirect_to category_path(skill.category)
    else
      render action
    end
  end

  def is_admin?
    unless current_developer.admin?
      redirect_to category_path(skill.category)
    end
  end

  private

  def skill_attributes
    params.require(:skill).permit(
      :name
    )
  end
end
