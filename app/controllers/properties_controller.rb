class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
    def index 
        @properties = Property.order('created_at DESC')
    end

    def new
      @property = Property.new
    end

    def create
      @property = Property.new(property_params)

      if @property.save
        redirect_to @property, notice: "Property was successfully created."
      else
        render :new
      end
    end

    def show
    end

    def update
      if @property.update(property_params)
        redirect_to @property, notice: "Property was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @property.destroy
      redirect_to properties_url, notice: "Property was successfully destroyed"
    end


    private 

    def property_params
        params.require(:property).permit(:name, :address, :property_number, :property_image, :city, :postal_code, :rent, :tenant)
      end
    

      def set_property
        @property = Property.find(params[:id])
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