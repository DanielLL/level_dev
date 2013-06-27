class DevelopersController < ApplicationController
  before_filter :authenticate_developer!

  def index
    if developer_signed_in?
      if current_developer.admin?
        @who = "Eres Administrador"
        @developers = Developer.all
      else
        @who = "Eres developer"
      end
    end
  end
end
