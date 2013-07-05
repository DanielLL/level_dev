class SkillsController < ApplicationController
  before_filter :authenticate_developer!
  expose(:category)
  expose(:skills) { category.skills }
  expose(:skill, attributes: :skill_attributes)

  def index
  end

  def new
  end

  def create
    if skill.save
      render :index
    else
      render :new
    end
  end

  def destroy
    if skill.destroy
      redirect_to category_skills_path(skill.category)
    else
      redirect_to category_skills_path(skill.category)
    end
  end

  def edit
  end

  def update
    if skill.save
      render :index
    else
      render :new
    end
  end

  private

  def skill_attributes
    params.require(:skill).permit(
      :name
    )
  end
end
