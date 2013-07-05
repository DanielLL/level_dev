LevelDev::Application.routes.draw do
  devise_for :developers, controllers: { :registrations => "registrations" }
  resources :developers, only: :show
  root to: "developers#index"

  resources :categories do
    resources :skills, except: :show
  end

  resources :developers do
    resources :skill_devs
  end
end
