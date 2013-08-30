class Area < ActiveRecord::Base
  
  #validations

  validates_presence_of :name, :description, :percentage
  validates_numericality_of :percentage
  before_create :valid_percentage?

  #relations
  
  has_many :skills, dependent: :destroy
  default_scope self.all.order('created_at asc')

  # methods

  def valid_percentage?
    if self.new_record?
      percentage_total = Area.all.sum(:percentage) + self.percentage
    else
      areas_array = Area.all.reject{ |area| area.id == self.id }
      percentage_total = areas_array.map(&:percentage).sum() + self.percentage
    end
    valid = percentage_total > 100 ? false : true
    return valid
  end

end
