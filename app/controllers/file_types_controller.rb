class FileTypesController < ApplicationController
  
  # GET /file_types
  def index
    @types = FileType.all

    render json: @types
  end

  # GET /file_types/1
  def show
    render json: @type
  end

  # POST /file_types
  def create
    @type = FileType.new(type_params)

    if @type.save
      render json: @type, status: :created, location: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /file_types/1
  def update
    if @type.update(tag_params)
      render json: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /file_types/1
  def destroy
    @type.destroy
  end
  
  private
    def type_params
      params.require(:file_type).permit(:tipo)
    end
end
