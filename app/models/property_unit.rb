class PropertyUnit < ApplicationRecord
  belongs_to :property
  has_many :todo_items
  #has_one :tenant
end
