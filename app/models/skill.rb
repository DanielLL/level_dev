class Skill < ActiveRecord::Base

  #validations

  validates_presence_of :name

  #relations
  
  belongs_to :category
  has_many   :skill_devs, dependent: :destroy

end
