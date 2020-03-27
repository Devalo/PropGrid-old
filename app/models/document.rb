class Document < ApplicationRecord
  has_one_attached :doc
  has_one :user
  has_one :property_unit
end
