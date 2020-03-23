class Lease < ApplicationRecord
  has_one_attached :lease_pdf
  belongs_to :user
  belongs_to :property_unit
  belongs_to :tenant
end
