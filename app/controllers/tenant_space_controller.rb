class TenantSpaceController < ApplicationController
  before_action :authenticate_tenant!
  def index
    @property_unit = PropertyUnit.find_by(tenant: current_tenant.id)
    p @property = Property.find_by(id: @property_unit.property_id)
    @tenant = Tenant.find_by(id: current_tenant.id)

  end
end
