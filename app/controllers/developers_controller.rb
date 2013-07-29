class DevelopersController < ApplicationController
  before_filter :authenticate_developer!
  before_filter :is_admin?

  expose(:developers)
  expose(:developer, attributes: :developer_attributes)

  def index
    if developer_signed_in?
      if current_developer.admin?
        @developers = Developer.all
      else
        redirect_to developer_path(current_developer) 
        @who = "You are developer"
      end
    end
  end

  def show
  end

  def is_admin?
    if current_developer != (developer rescue nil) && !current_developer.admin?       
      redirect_to developer_path(current_developer)
    end
  end

  def edit
  end

  def update
    save_update(:edit)
  end

  def save_update(action)
    if developer.save
      redirect_to developer_path
    else
      render action
    end
  end
    private 

  def developer_attributes
    params.require(:developer).permit(
      :name,
      :email
    )
  end

end
