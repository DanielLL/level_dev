class Skill < ActiveRecord::Base

  #validations

  validates_presence_of :name

  #relations
  
  belongs_to :area
  has_many   :dev_skills, dependent: :destroy

end
