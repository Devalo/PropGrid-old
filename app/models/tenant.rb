class Tenant < ApplicationRecord
  belongs_to :user
  #has_many :property_units
end
