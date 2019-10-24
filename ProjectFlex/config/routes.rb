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
  post "login" => "member#login"
  
  post "Logout" => 'member#logout'
  
  get 'Logout' => 'member#logout'
  #CAS auth back to home
  get "login" => "member#login"
  
  #Approve Points route
  get "approvepoints" => "member#approvepoints"
  
  #Calendar routes
  get "calendar" => "member#calendar"
  get "event" => "member#event"
  post "new_event" => "member#newEvent"
  post "delete_event" => "member#deleteEvent"
  
  #Forms route
  get "forms" => "member#forms"
  
  #Marketplace route
  get "marketplace" => "member#marketplace"
  
  #My Points route
  get "mypoints" => "member#mypoints"
  
  #My Registrations route
  get "myregistrations" => "member#myregistrations"
  
  
end
