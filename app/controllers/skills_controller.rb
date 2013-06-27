class SkillsController < ApplicationController
  expose(:skills)
  expose(:skill, attributes: :skill_attributes)

  def index
  end

  def new
  end

  def create
  end

  private

  def category_attributes
    params.require(:skill).permit(
      :name
    )
  end
end
