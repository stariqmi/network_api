class User < ActiveRecord::Base
  belongs_to :event
  validates :email, uniqueness: true
end
