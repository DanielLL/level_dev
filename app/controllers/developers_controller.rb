class DevelopersController < ApplicationController
  before_filter :authenticate_developer!
  expose(:developers)
  expose(:developer)

  def index
    if developer_signed_in?
      if current_developer.admin?
        @who = "You are Administrator"
        @developers = Developer.all
      else
        redirect_to developer_path(current_developer) 
        @who = "You are developer"
      end
    end
  end

  def show
    if developer_path != developer_path(current_developer)
      redirect_to developer_path(current_developer)
    end
  end

end
