class Trip < ActiveRecord::Base
  has_many :activities
end