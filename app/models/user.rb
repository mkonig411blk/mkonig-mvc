class User < ActiveRecord::Base
  has_secure_password
  has_many :trips
  has_many :activities, through: :trips
  # always me to call user.activities
end
