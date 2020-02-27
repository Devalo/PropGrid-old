class PropertyUnit < ApplicationRecord
  belongs_to :property
  has_many :todo_items, dependent: :destroy
  #has_one :tenant
end
