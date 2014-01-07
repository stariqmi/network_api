class UserController < ApplicationController
    
    # Need to implement a security, key system due to next line
    skip_before_filter :verify_authenticity_token

    # Validate API_KEY
    before_filter :check_api_key, except: [:create, :all]

    def check_api_key
        user = User.find_by(api_key: params[:api_key])
        check = user != nil and user[:id] == params[:id]
        head :unauthorized unless check
    end


    def all
        users = User.all
        users.each do |user|
            # user[:id] = ""
            user[:api_key] = ""
        end
        render json: users
    end


    def show
        print params[:id]
        user = User.find_by id: params[:id]
        render json: user
    end


    def create
        user = User.create(first_name: params[:first_name],
                            last_name: params[:last_name],
                            linkedin_id: params[:linkedin],
                            email: params[:email],
                            gps_coord: params[:gps])
        if user.id == nil
            render :json => {error: "Email already exists"}
        else
            render :json => user
        end
    end


    def update_gps
        user = User.find_by id: params[:id]
        user[:gps_coord] = params[:coords]
        render json: user
    end


    def attend_event
        user = User.find_by id: params[:id]
        user.update_attribute(:event_id, params[:event_id])
        render json: user
    end


    def add_event
        user = User.find_by id: params[:id]
        if user[:event_wishlist] == nil or user[:event_wishlist] == ""
            puts "First Event"
            user.update_attribute(:event_wishlist, params[:event_id])
        else
            puts "Additional Event"
            user.update_attribute(:event_wishlist, user[:event_wishlist] + "," + params[:event_id])
        end
        render json: user
    end


    def update
        user = User.find_by id: params[:id]
        user.update_attributes(first_name: params[:first_name], last_name: params[:last_name],
                                linkedin_id: params[:linkedin], email: params[:email])
        render json: user
    end


    def wishlist
        user = User.find_by id: params[:id]
        wishlist = []
        user.event_wishlist.split(",").each do |event_id|
            wishlist << Event.find_by(id: event_id)
        end
        render json: wishlist
    end


    def delete
        user = User.find_by id: params[:id]
        user.destroy
        render json: {status: "success"}
    end
    
end
