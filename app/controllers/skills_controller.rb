class SkillsController < ApplicationController
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

  def show
  end

  def destroy
    if skill.destroy
      render :index
    else
      render :index
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
