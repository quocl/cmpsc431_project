class OrderedItem < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :user
  has_one :sale_item
end
