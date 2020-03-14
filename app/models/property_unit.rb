class PropertyUnit < ApplicationRecord
  belongs_to :property
  has_many :todo_items
  #has_one :tenant




  # Typpe of property that will be used when creating a new unit
  enum property_type: {
    "Leilighet"           => 0,
    "Rom med fellesareal" => 1,
    "Bolig"               => 2,
    "Næringsbygg"         => 3,
    "Lager"               => 4,
  }
  #validates :property_type, inclusion: property_selections.keys
end
