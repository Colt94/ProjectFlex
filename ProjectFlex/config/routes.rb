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
  
  post "Logout" => 'logins#logout'
  
  get 'Logout' => 'logins#logout'
  #CAS auth back to home
  get "login" => "member#login"
  
  #Approve Points route
  get "approvepoints" => "member#approvepoints"
  
  #Calendar routes
  get "calendar" => "member#calendar"
  resources :events
  get "event" => "event#event"
  post "events/approve_attendance"
  resources :event_attendances
  
  #Forms route
  get "forms" => "member#forms"
  
  #Manage Users routes
  get "manageusers" =>"member#manageusers"
  resources :users
  get "user" => "user#show"
  post "users/approve_attendance"
  
  #Marketplace route
  get "marketplace" => "member#marketplace"
  
  #My Points route
  get "mypoints" => "member#mypoints"
  
  #My Registrations route
  get "myregistrations" => "member#myregistrations"
  
  
  get '/auth/google_oauth2/callback', to: 'logins#create'
  
end
