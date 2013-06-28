class DevelopersController < ApplicationController
  before_filter :authenticate_developer!
  expose(:developers)
  expose(:developer)

  def index
    if developer_signed_in?
      if current_developer.admin?
        @who = "Eres Administrador"
        @developers = Developer.all
      else
        @who = "Eres developer"
        redirect_to developer_path(current_developer) 
      end
    end
  end

  def show

  end
end
