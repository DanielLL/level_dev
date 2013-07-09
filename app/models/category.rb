class Category < ActiveRecord::Base
  
  #validations

  validates_presence_of :name, :description, :percentage
  validates_numericality_of :percentage

  #relations
  
  has_many :skills, dependent: :destroy

  # methods

  def valid_percentage?
    if self.new_record?
      percentage_total = Category.all.sum(:percentage) + self.percentage
    else
      categories_array = Category.all.reject{ |category| category.id == self.id }      
      percentage_total = categories_array.map(&:percentage).sum() + self.percentage
    end

    return percentage_total > 100 ? true : false
  end

end
