class Property < ApplicationRecord
    has_many :units
    validates :address, length: { in: 2..100}
    validates :property_number, length: { maximum: 1000}
    validates :postal_code, length: { in: 3..4}
    validates :city, length: { in: 2..50}
    validates :property_image, length: {maximum: 100}

end


#t.string "name"
#    t.string "address"
#    t.string "property_number"
#    t.integer "postal_code"
#    t.string "city"
#    t.string "property_image"
#    t.integer "rent"
#    t.string "tenant"