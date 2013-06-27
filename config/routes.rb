LevelDev::Application.routes.draw do
  devise_for :developers, :controllers => { :registrations => "registrations" }
  resources :categories
end
