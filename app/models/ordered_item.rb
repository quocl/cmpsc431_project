class OrderedItem < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :user
end
