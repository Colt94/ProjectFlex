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
  
  #CAS auth back to home
  get "login" => "member#home"
  
  #Approve Points route
  get "approvepoints" => "member#approvepoints"
  
  #Calendar route
  get "calendar" => "member#calendar"
  
  #Forms route
  get "forms" => "member#forms"
  
  #Marketplace route
  get "marketplace" => "member#marketplace"
  
  #My Points route
  get "mypoints" => "member#mypoints"
  
  #My Registrations route
  get "myregistrations" => "member#myregistrations"
  
  
end
