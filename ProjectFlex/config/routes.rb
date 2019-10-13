Rails.application.routes.draw do
  get "/", to: "static#home", as: "root"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # About route
  get "about" => "static#about"
  
  # Contact route
  get "contact" => "static#contact"
  
  # Staff route
  get "staff" => "static#staff"
  
  #Login route
  post "login" => "member#home"
  
  get "login" => "member#home"
  
  
  
end
