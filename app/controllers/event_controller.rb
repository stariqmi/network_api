class EventController < ApplicationController

	# Need to implement a security, key system due to next line
	skip_before_filter :verify_authenticity_token

	# Validate API_KEY
    before_filter :check_api_key, except: [:all, :show]

    def check_api_key
        user = User.find_by(api_key: params[:api_key])
        check = user != nil and user[:id] == params[:admin]
        head :unauthorized unless check
    end


	def all
		events = Event.all
		render json: events
	end


	def show
		event = Event.find_by id: params[:id]
		render json: event
	end


	def create
		args = {
			title: params[:title],
			admin: params[:admin],
			start_date: Date.strptime(params[:start_date], '%d-%m-%Y'),
			end_date: Date.strptime(params[:end_date], '%d-%m-%Y'),
			start_time: params[:start_time],
			end_time: params[:end_time],
			address: params[:address],
			gps_coord: params[:gps]
		}

		event = Event.create(args)
		if event.id == nil
            render :json => {error: "Event by title already exists"}
        else
            render :json => event
        end
	end


	def update
		event = Event.find_by id: params[:id]
		args = {
			title: params[:title],
			admin: params[:admin],
			start_date: Date.strptime(params[:start_date], '%d-%m-%Y'),
			end_date: Date.strptime(params[:end_date], '%d-%m-%Y'),
			start_time: params[:start_time],
			end_time: params[:end_time],
			address: params[:address],
			gps_coord: params[:gps]
		}

		event.update_attributes(args)
		render json: event
	end

end
