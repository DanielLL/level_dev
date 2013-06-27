class Category < ActiveRecord::Base
  
  #validations

  validates_presence_of :name, :description, :percentage
  validates_numericality_of :percentage

end
