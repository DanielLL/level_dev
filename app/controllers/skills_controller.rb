class SkillsController < ApplicationController
  expose(:skills)
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

  def show
  end

  def destroy
    if skill.destroy
      redirect_to category_skills_path(:category), success: "Your skill was deleted"
    else
      redirect_to category_skills_path(:category), error: "Your skill wasn't deleted"
    end
  end

  private

  def skill_attributes
    params.require(:skill).permit(
      :name
    )
  end

end
