class DevelopersController < ApplicationController
  before_filter :authenticate_developer!
  before_filter :is_admin?, only: :edit

  expose(:developers)
  expose(:developer, attributes: :developer_attributes)

  def is_admin?
    if current_developer != (developer rescue nil) && !current_developer.admin?       
      redirect_to developer_path(current_developer)
    end
  end

  def update
    developer.save ? (redirect_to developer_path) : ( render :edit)
  end

  private 

  def developer_attributes
    params.require(:developer).permit(
      :name,
      :email
    )
  end

end
