class SkillDevsController < ApplicationController
  expose(:developer)
  expose(:skill_devs, ancestor: :developer)
  expose(:skill_dev)
  before_filter :valid_developer

  def index
  end

  def create
  end

  def update
  end

  def valid_developer
  end

  private

  def skiill_devs_params
    params.require(:question).permit(:text, :id, :country)
  end

end
