class TenantSpaceController < ApplicationController
  before_action :authenticate_tenant!
  def index

  #  @property_unit = PropertyUnit.find_by(tenant: current_tenant.id)
  #  @property = Property.find_by(id: @property_unit.property_id)
  #  @tenant = Tenant.find_by(id: current_tenant.id)
  #  @lease = Lease.find_by(tenant_id: current_tenant.id)

    puts "---- INFO FROM TENANT SPACE CONTROLLER"
    puts "-----"
    puts "current_tenant.id"
    p current_tenant.id
    puts "-"

  end

  def leases

    @tenant_lease = []

    Lease.find_each do |l|
      if l.tenant_id == current_tenant.id
        @tenant_lease.push(l)
      end
    end
     @tenant_lease.each do |l| p l.id end




  end
end
