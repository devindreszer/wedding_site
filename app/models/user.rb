class User < ActiveRecord::Base
  has_many :registry_items
end
