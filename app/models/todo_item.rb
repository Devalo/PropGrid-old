class TodoItem < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :property_unit
  validates :title, presence: true
end
