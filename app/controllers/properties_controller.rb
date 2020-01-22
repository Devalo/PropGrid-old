class PropertiesController < ApplicationController
    def index 
        @properties = Property.all
    end


    private 

    def properties_params
        params.require(:property).permit(:name, :address, :property_number, :property_image, :city, :postal_code, :rent, :tenant)
      end
end

#t.string "name"
#    t.string "address"
#    t.string "property_number"
#    t.integer "postal_code"
#    t.string "city"
#    t.string "property_image"
#    t.integer "rent"
#    t.string "tenant"