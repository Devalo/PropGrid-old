class PropertyUnitsController < ApplicationController
  before_action :get_property
  before_action :set_property_unit, only: [:show, :edit, :update, :destroy]

  # GET /property_units
  # GET /property_units.json
  def index
    #finds the property units related to the spesific property
    @property_units = @property.property_units
  end

  # GET /property_units/1
  # GET /property_units/1.json
  def show
    proper_user
  end

  # GET /property_units/new
  def new
    #creates a new object with proper relationships
    @property_unit = @property.property_units.build
  end

  # GET /property_units/1/edit
  def edit
    proper_user
  end

  # POST /property_units
  # POST /property_units.json
  def create
    
    @property_unit = @property.property_units.build(property_unit_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @property_unit.save
        format.html { redirect_to property_path(@property), notice: 'Property unit was successfully created.' }
        format.json { render :show, status: :created, location: @property_unit }
      else
        format.html { render :new }
        format.json { render json: @property_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_units/1
  # PATCH/PUT /property_units/1.json
  def update
    proper_user
    respond_to do |format|
      if @property_unit.update(property_unit_params)
        format.html { redirect_to property_path(@property), notice: 'Property unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_unit }
      else
        format.html { render :edit }
        format.json { render json: @property_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_units/1
  # DELETE /property_units/1.json
  def destroy
    proper_user
    @property_unit.destroy
    respond_to do |format|
      format.html { redirect_to property_path(@property), notice: 'Property unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    #Creates a local @property instance by finding a property instance by property_id to relate property units and properties.
    def get_property
      @property = Property.find(params[:property_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_property_unit
      @property_unit = @property.property_units.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_unit_params
      params.require(:property_unit).permit(:unit_number, :tenant, :description, :property_id)
    end
    
    def proper_user
      if current_user.id != @property_unit.user_id 
        redirect_to properties_url 
        flash[:notice] = "Fant ikke det du letet etter."
      end
    end

end
