class User < ActiveRecord::Base
  has_secure_password
  has_many :trips
  has_many :activities, through: :trips
  # is this has_many through relationship necessary?
end
