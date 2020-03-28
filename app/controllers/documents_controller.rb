class DocumentsController < ApplicationController
    before_action :set_document, only: [:show, :edit, :update, :destroy]
    before_action :get_property_unit
    before_action :get_property

    require "image_processing/mini_magick"



    # GET /documents
    # GET /documents.json
    def index
      @documents = Document.all
      @document = Document.new
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
    end

    # GET /documents/1/edit
    def edit
    end

    # POST /documents
    # POST /documents.json
    def create
      @document = Document.new(document_params)
      @document = @property_unit.documents.build(document_params)
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

          format.html { redirect_to root_path, notice: 'Document was successfully created.' }
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
      @document.destroy
      respond_to do |format|
        format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
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


      # Never trust parameters from the scary internet, only allow the white list through.

      def document_params
        params.require(:document).permit(:title, :doc)
      end
end
