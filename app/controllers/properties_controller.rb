class PropertiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_property, only: [:show, :edit, :update, :destroy]





    def index
       # @properties = Property.order('created_at DESC')
        @properties = current_user.properties
        puts current_user.id

        add_breadcrumb "Eiendommer", properties_path
    end

    def new
      #@property = Property.new
      @property = current_user.properties.build
    end

    def create
      @property = Property.new(property_params.merge(user_id: current_user.id))
      user_id = @current_user
      puts user_id

      if @property.save
        redirect_to @property, notice: "Property was successfully created."
      else
        render :new
      end
    end


    def show
      @property_units = @property.property_units
      proper_user

      add_breadcrumb "Eiendommer", properties_path
      add_breadcrumb "Enheter ", @property


    end

    def edit
      proper_user
    end

    def update
      proper_user
      if @property.update(property_params)
        redirect_to @property, notice: "Property was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      proper_user
      @property.destroy
      redirect_to properties_url, notice: "Property was successfully destroyed"
    end


    private

    def property_params
        params.require(:property).permit(:name, :address, :property_number, :property_image, :city, :postal_code, :rent)
    end


      def set_property
        @property = Property.find(params[:id])
      end

      def proper_user
        if current_user.id != @property.user_id
          redirect_to properties_url
          flash[:notice] = "Fant ikke det du letet etter."
        end
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
