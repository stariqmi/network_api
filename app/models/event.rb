class Event < ActiveRecord::Base
	has_many :users
	validates :title, uniqueness: true
end
