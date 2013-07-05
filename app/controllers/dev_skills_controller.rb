class DevSkillsController < ApplicationController
  expose(:developer)
  expose(:dev_skills, ancestor: :developer)
  expose(:dev_skill)

  def index
  end

  def create
  end

  def update
  end


end
