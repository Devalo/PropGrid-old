class FoobarsController < ApplicationController
  before_action :set_foobar, only: [:show, :edit, :update, :destroy]

  # GET /foobars
  # GET /foobars.json
  def index
    @foobars = Foobar.all
  end

  # GET /foobars/1
  # GET /foobars/1.json
  def show
  end

  # GET /foobars/new
  def new
    @foobar = Foobar.new
  end

  # GET /foobars/1/edit
  def edit
  end

  # POST /foobars
  # POST /foobars.json
  def create
    @foobar = Foobar.new(foobar_params)

    respond_to do |format|
      if @foobar.save
        format.html { redirect_to @foobar, notice: 'Foobar was successfully created.' }
        format.json { render :show, status: :created, location: @foobar }
      else
        format.html { render :new }
        format.json { render json: @foobar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foobars/1
  # PATCH/PUT /foobars/1.json
  def update
    respond_to do |format|
      if @foobar.update(foobar_params)
        format.html { redirect_to @foobar, notice: 'Foobar was successfully updated.' }
        format.json { render :show, status: :ok, location: @foobar }
      else
        format.html { render :edit }
        format.json { render json: @foobar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foobars/1
  # DELETE /foobars/1.json
  def destroy
    @foobar.destroy
    respond_to do |format|
      format.html { redirect_to foobars_url, notice: 'Foobar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foobar
      @foobar = Foobar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foobar_params
      params.require(:foobar).permit(:name, :number)
    end
end
