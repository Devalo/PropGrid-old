class LeasesController < ApplicationController
  before_action :get_property_unit
  before_action :get_property
  before_action :set_lease, only: [:show, :edit, :update, :destroy]

  def index
    @lease = Lease.all
  end

  def new
    #build_lease because of the one_to_one relationship
    #which differs from "property_unit.leases.build" since property unit
    #only has one lease.
    @lease = @property_unit.build_lease

  end


  def create
  #  @match = Match.find(params[:match_id])
  #  @score = @match.create_score(params[:score])
  end

  private
  #Make @property_unit available in class
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
end
