class Lease < ApplicationRecord
  belongs_to :user
  belongs_to :property_unit
  belongs_to :tenant
end
