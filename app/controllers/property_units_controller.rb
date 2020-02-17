class PropertyUnitsController < ApplicationController
  before_action :set_property_unit, only: [:show, :edit, :update, :destroy]

  # GET /property_units
  # GET /property_units.json
  def index
    @property_units = PropertyUnit.all
  end

  # GET /property_units/1
  # GET /property_units/1.json
  def show
  end

  # GET /property_units/new
  def new
    @property_unit = PropertyUnit.new
  end

  # GET /property_units/1/edit
  def edit
  end

  # POST /property_units
  # POST /property_units.json
  def create
    @property_unit = PropertyUnit.new(property_unit_params)

    respond_to do |format|
      if @property_unit.save
        format.html { redirect_to @property_unit, notice: 'Property unit was successfully created.' }
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
    respond_to do |format|
      if @property_unit.update(property_unit_params)
        format.html { redirect_to @property_unit, notice: 'Property unit was successfully updated.' }
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
    @property_unit.destroy
    respond_to do |format|
      format.html { redirect_to property_units_url, notice: 'Property unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_unit
      @property_unit = PropertyUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_unit_params
      params.require(:property_unit).permit(:unit_number, :tenant, :description, :property_id)
    end
end
