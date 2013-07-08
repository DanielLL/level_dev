class Category < ActiveRecord::Base
  
  #validations

  validates_presence_of :name, :description, :percentage
  validates_numericality_of :percentage

  #relations
  
  has_many :skills, dependent: :destroy

  # methods

  def percentage_greater_than_100?
    percentage_total = Category.all.sum(:percentage) + self.percentage
    if percentage_total > 100
      return true
    else
      return false
    end
  end

end
