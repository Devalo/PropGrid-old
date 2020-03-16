class LeasesController < ApplicationController
  before_action :get_property_unit
  before_action :get_property
  before_action :set_lease, only: [:show, :edit, :update, :destroy]

  def index
    @lease = Lease.all
  end

  def new
    lease_exists?
  end


  def create
  #  @match = Match.find(params[:match_id])
  #  @score = @match.create_score(params[:score])

    @property_unit = PropertyUnit.find(params[:property_unit_id])
    tenant = @property_unit.tenant
    user = current_user.id
    @lease = @property_unit.create_lease(lease_params.merge(user_id: user, tenant_id: tenant))


      respond_to do |format|
        if @lease.save

          #format.html { redirect_to property_property_unit_path(@property), notice: 'Enheten ble opprettet' }
          format.html { redirect_to property_property_unit_path(@property, @property_unit), notice: 'Opprettet' }
          format.json { render :show, status: :created, location: @property_unit }
        else
          format.html { render :new }
          format.json { render json: @lease.errors, status: :unprocessable_entity }
        end
    end

    p @lease
  end

  private
  #Make @property_unit available in class
  def lease_params
    params.require(:lease).permit(:due_date,  :rent_account, :power_included, :water_wastewater,
                                              :rent_indefinite, :rent_start_date, :rent_stop_date,
                                              :deposit, :deposit_account, :deposit_guarantee, :deposit_guarantee_issuer,
                                              :animals, :animal_specify, :smoking, :cable_tv, :internet, :other_description
                                              )
  end

  def get_property_unit
    @property_unit = PropertyUnit.find(params[:property_unit_id])
  end
  def get_property
    @property = Property.find(params[:property_id])
  end

  def set_lease
  #  @lease = @property.property_units.find(params[:id])
    @lease = @property_units.lease.find(params[:id])
  end

  def proper_user
    if current_user.id != @lease.user_id || current_tenant.id != @lease.tenant_id
      redirect_to properties_url
      flash[:notice] = 'Fant ikke det du letet etter.'
    end
  end

  def lease_exists?
    # TODO:  MÅ REFACTORES TIL MODEL ELLER CONCERN
    @property_unit = PropertyUnit.find(params[:property_unit_id])
    find_lease = Lease.find_by(property_unit_id: @property_unit.id)

    if find_lease
      if find_lease.property_unit_id == @property_unit.id
        redirect_to property_property_unit_path(@property, @property_unit), notice: 'Allerede opprettet'
      end
    else
      #build_lease because of the one_to_one relationship
      #which differs from "property_unit.leases.build" since property unit
      #only has one lease.
      @lease = @property_unit.build_lease
    end

  end

end
