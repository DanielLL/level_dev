module CategoriesHelper

  #This method order skills in the right way
  def ordered_skills(skills)
    skills.order('created_at asc')
  end
end
