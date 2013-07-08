class Category < ActiveRecord::Base
  
  #validations

  validates_presence_of :name, :description, :percentage
  validates_numericality_of :percentage

  #relations
  
  has_many :skills, dependent: :destroy

  # methods

  def valid_percentage?
    percentage_total = Category.all.sum(:percentage) + self.percentage
    return percentage_total > 100 ? true : false
  end

end
