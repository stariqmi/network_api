class User < ActiveRecord::Base
  belongs_to :event
  validates :email, uniqueness: true
  before_create :generate_api_key

  def generate_api_key
    while true do
        self.api_key = SecureRandom.hex
        break unless self.class.exists?(api_key: api_key)
    end
  end
end
