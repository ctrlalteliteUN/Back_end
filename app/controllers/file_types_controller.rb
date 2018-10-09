class FileTypesController < ApplicationController
  before_action :set_file_type, only: [:show, :update, :destroy]
  
  # GET /file_types
  def index
    @types = FileType.all

    render json: @types
  end

  # GET /file_types/1
  def show
    render json: @file_type
  end

  # POST /file_types
  def create
    @type = FileType.new(type_params)
    if @type.save
      directory_name = "files/#{type_params[:tipo]}"
      Dir.mkdir(directory_name) unless File.exists?(directory_name)
      render json: @type, status: :created, location: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /file_types/1
  def update
    @old_name = @file_type[:tipo]
    if @file_type.update(type_params)
      File.rename "files/#{@old_name}", "files/#{type_params[:tipo]}"
      render json: @file_type
    else
      render json: @file_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /file_types/1
  def destroy
    @old_name = @file_type[:tipo]
    if @file_type.destroy
      FileUtils.rm_rf("files/#{@old_name}")
      render json: @file_type
    else
      render json: @file_type.errors, status: :unprocessable_entity
    end
  end
  
  private
    def set_file_type
      @file_type = FileType.find(params[:id])
    end
    def type_params
      params.require(:file_type).permit(:id,:tipo)
    end
end
