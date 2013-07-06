class DevSkillsController < ApplicationController
  expose(:developer)
  expose(:dev_skills, ancestor: :developer)
  expose(:dev_skill)

  def index
  end

  def create
    developer.dev_skills.destroy_all
    params[:ids_array].each do |skill_id|
      skill = Skill.find(skill_id)
      developer.dev_skills.create(skill_id: skill.id)
    end
    redirect_to developer_path(developer)
  end

end

