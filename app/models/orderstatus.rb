class Orderstatus < ActiveRecord::Base
  has_many :orders
end
