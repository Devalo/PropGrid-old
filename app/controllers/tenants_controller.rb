class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]

  # GET /tenants
  # GET /tenants.json
  def index
    #proper_user
    @tenants = current_user.tenants
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
    proper_user
  end

  # GET /tenants/new
  def new
    @tenant = current_user.tenants.build
  end

  # GET /tenants/1/edit
  def edit
    proper_user
  end

  # POST /tenants
  # POST /tenants.json
  def create
    @tenant = Tenant.new(tenant_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @tenant.save
        format.html { redirect_to @tenant, notice: 'Tenant was successfully created.' }
        format.json { render :show, status: :created, location: @tenant }
      else
        format.html { render :new }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update
    proper_user
    respond_to do |format|
      if @tenant.update(tenant_params)
        format.html { redirect_to @tenant, notice: 'Tenant was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant }
      else
        format.html { render :edit }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    proper_user
    @tenant.destroy
    respond_to do |format|
      format.html { redirect_to tenants_url, notice: 'Tenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_params
      params.require(:tenant).permit(:first_name, :last_name, :email, :phone_number)
    end


    def proper_user
      if current_user.id != @tenant.user_id
        redirect_to tenants_url
        flash[:notice] = "Fant ikke det du letet etter."
      end
    end
end
