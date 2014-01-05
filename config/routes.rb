Network::Application.routes.draw do
  
  # User routes
  match "users", to: "user#all", via: :get
  match "user/:id/:api_key", to: "user#show", via: :get
  match "user/create/:first_name/:last_name/:linkedin/:email/:gps", to: "user#create", via: :post 
  match "user/update_gps/:id/:api_key/:coords", to: "user#update_gps", via: :put
  match "user/attend_event/:id/:api_key/:event_id", to: "user#attend_event", via: :put
  match "user/add_event/:id/:api_key/:event_id", to: "user#add_event", via: :put
  match "user/update/:id/:api_key/:first_name/:last_name/:linkedin/:email", to: "user#update", via: :put
  match "user/wishlist/:id/:api_key", to: "user#wishlist", via: :get

  # Event routes
  match "events", to: "event#all", via: :get
  match "event/:id", to: "event#show", via: :get
  match "event/create/:admin/:api_key/:title/:start_date/:end_date/"\
        ":start_time/:end_time/:address/:coords", to: "event#create", via: :post
  match "event/update/:id/:admin/:api_key/:title/:start_date/:end_date/"\
        ":start_time/:end_time/:address/:coords", to: "event#update", via: :put

  # Special Routes

end
