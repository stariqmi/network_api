Network::Application.routes.draw do
  
  # User routes
  match "users", to: "user#all", via: :get
  match "user/:id", to: "user#show", via: :get
  match "user/create/:first_name/:last_name/:linkedin/:email/:gps", to: "user#create", via: :post 
  match "user/update_gps/:id/:coords", to: "user#update_gps", via: :put
  match "user/attend_event/:id/:event_id", to: "user#attend_event", via: :put
  match "user/add_event/:id/:event_id", to: "user#add_event", via: :put
  match "user/update/:id/:first_name/:last_name/:linkedin/:email", to: "user#update", via: :put
  match "user/wishlist/:id", to: "user#wishlist", via: :get

  # Event routes
  match "events", to: "event#all", via: :get
  match "event/:id", to: "event#show", via: :get
  match "event/create/:title/:admin/:start_date/:end_date/"\
        ":start_time/:end_time/:address/:coords", to: "event#create", via: :post
  match "event/update/:id/:title/:admin/:start_date/:end_date/"\
        ":start_time/:end_time/:address/:coords", to: "event#update", via: :put

  # Special Routes

end
