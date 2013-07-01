class Skill < ActiveRecord::Base

  #validations

  validates_presence_of :name

  #relations
  
  belongs_to :category

end
