class TenantSpaceController < ApplicationController
  before_action :authenticate_tenant!
  def index

  end
end
