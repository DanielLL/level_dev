class DevSkill < ActiveRecord::Base

  #validations

  validates_presence_of :developer, :skill

  #relations
  belongs_to :developer
  belongs_to :skill

end
