class LeasesController < ApplicationController
  #before_action :get_property_unit
  #before_action :set_lease, only: [:show, :edit, :update, :destroy]

  def index
    @lease = Lease.all
  end

  def new
  end

  private
  def get_property_unit
  #  @lease = Lease.find(params[:propery_unit_id])
  end

  def set_lease
  #  @lease = @property.property_units.find(params[:id])
  #  @lease = @property_units.lease.find(params[:id])
  end

  def proper_user
    if current_user.id != @lease.user_id || current_tenant.id != @lease.tenant_id
      redirect_to properties_url
      flash[:notice] = 'Fant ikke det du letet etter.'
    end
  end
end
