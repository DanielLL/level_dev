class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name

  has_many :dev_skills, dependent: :destroy


  def current_skills(skills)
    array = []
    skills.each do |skill|
      array << [skill.attributes.merge("visible" => self.has_skill?(skill))]
    end
    return array
  end

  def has_skill?(skill)
    self.dev_skills.where(skill_id: skill.id).present?
  end

end
