class DocumentsController < ApplicationController
    before_action :set_document, only: [:show, :edit, :update, :destroy]
    before_action :get_property_unit
    before_action :get_property
    before_action :proper_user

    require "image_processing/mini_magick"



    # GET /documents
    # GET /documents.json
    def index
    #  @documents = Document.all
      @document = Document.new
      @documents = @property_unit.documents
      # @documents = @property_units.documents


      puts "-------"
      puts "-------"


      @property_units = @property.property_units

      proper_user
      add_breadcrumb "Eiendommer", properties_path
      add_breadcrumb "Enheter ", @property
      add_breadcrumb "Enhet #{@property_unit.unit_number}", [@property, @property_unit]
      add_breadcrumb "Dokumenter", [@property, @property_unit, @document]

    end

    # GET /documents/1
    # GET /documents/1.json
    def show
    end

    # GET /documents/new
    def new
      @document = @property.property_unit.documents.build
      @document = Document.new

      @property_unit = @property.property_units.build
      proper_user
    end

    # GET /documents/1/edit
    def edit
    end

    # POST /documents
    # POST /documents.json
    def create
      user_id = current_user.id
      @document = Document.new(document_params)
      @document = @property_unit.documents.build(document_params.merge(user_id: user_id))
      #@property_unit = @property.property_units.build(property_unit_params.merge(user_id: current_user.id))

      uploaded_item = params[:document][:doc]
      file_type = uploaded_item.content_type
    # this should probably go in the model..
      if file_type.include?("image")
        mini_image = MiniMagick::Image.new(uploaded_item.tempfile.path)
        mini_image.resize '1200x1200'
      end
      respond_to do |format|
        if @document.save
          format.html { redirect_to property_property_unit_documents_path(@property, @property_unit), notice: 'Dokumentet ble lagret.' }
          format.json { render :show, status: :created, location: @document }
        else
          format.html { render :new }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /documents/1
    # PATCH/PUT /documents/1.json
    def update
      respond_to do |format|
        if @document.update(document_params)
          format.html { redirect_to @document, notice: 'Document was successfully updated.' }
          format.json { render :show, status: :ok, location: @document }
        else
          format.html { render :edit }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /documents/1
    # DELETE /documents/1.json
    def destroy
      puts "------------------------"
      document_item = ActiveStorage::Attachment.find(@document.doc.id)
      p document_item.purge
      puts "------------------------"

      @document.destroy
      respond_to do |format|




        format.html { redirect_to property_property_unit_documents_path(@property, @property_unit), notice: 'Dokumentet ble slettet.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_document
        @document = Document.find(params[:id])
      end

      def get_property
        @property = Property.find(params[:property_id])
      end

      def get_property_unit
        @property_unit = PropertyUnit.find(params[:property_unit_id])
      end

      def proper_user
        owner_id = @property_unit.user_id

        if current_user.id != owner_id
          redirect_to properties_url
          flash[:info ] = 'Fant ikke det du letet etter.'
        end
      end



      # Never trust parameters from the scary internet, only allow the white list through.

      def document_params
        params.require(:document).permit(:title, :doc)
      end
end
