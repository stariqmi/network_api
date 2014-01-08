Network::Application.routes.draw do
  
  # User routes
  match "users", to: "user#all", via: :get
  match "user/:id/:api_key", to: "user#show", via: :get
  match "user/create", to: "user#create", via: :post            # /:first_name/:last_name/:linkedin/:email/:gps
  match "user/update_gps", to: "user#update_gps", via: :put     # /:id/:api_key/:coords
  match "user/attend_event", to: "user#attend_event", via: :put # /:id/:api_key/:event_id
  match "user/add_event", to: "user#add_event", via: :put       # /:id/:api_key/event_id
  match "user/update", to: "user#update", via: :put             # /:id/:api_key/:first_name/:last_name/:linkedin/:email
  match "user/wishlist/:id/:api_key", to: "user#wishlist", via: :get
  match "user/delete/:id/:api_key", to: "user#delete", via: :delete

  # Event routes
  match "events", to: "event#all", via: :get
  match "event/:id", to: "event#show", via: :get
  match "event/create", to: "event#create", via: :post          # /:admin/:api_key/:title/:start_date/:end_date/:start_time/:end_time/:address/:gps
  match "event/update", to: "event#update", via: :put           # /:id/:admin/:api_key/:title/:start_date/:end_date/:start_time/:end_time/:address/:gps
  match "event/delete/:id/:admin/:api_key", to: "event#delete", via: :delete

  # Special Routes

end
