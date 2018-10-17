class AppFilesController < ApplicationController
  before_action :set_app_files, only: [:show, :update, :destroy]
  # GET /app_files
  def index
    if params[:ProfilePhoto].present?
      if params[:user_id] != nil
        consulta = AppFile.foto_perfil(params[:user_id])
        operacion = send_file("files/#{FileType.find(consulta[:file_type_id])[:tipo]}/#{consulta[:ruta]}",
      :filename => consulta[:ruta],
      :type => "'application/png'")
      else
        render json: output = {'error' => 'Especifique la id del usuario'}.to_json
      end
    else
      @archivos = AppFile.all
  
      render json: @archivos
    end
  end

  # GET /app_files/1
  def show
    @operacion = send_file("files/#{FileType.find(@app_file[:file_type_id])[:tipo]}/#{@app_file[:ruta]}",
  :filename => @app_file[:ruta],
  :type => "'application/png'")
  end

  # POST /app_files
  def create
    @archivo = AppFile.new(app_file_params)

    if @archivo.save
      @archivo.crear_archivo_disco
      render json: @archivo, status: :created, location: @archivo
    else
      render json: @archivo.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /app_files/1
  def update
    if @app_file.update(app_file_params)
      @app_file.crear_archivo_disco
      render json: @app_file, status: :updated, location: @app_file
    else
      render json: @app_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /app_files/1
  def destroy
    if @app_file.destroy
      File.delete("files/#{FileType.find(@app_file[:file_type_id])[:tipo]}/#{@app_file[:ruta]}") if File.exist?("files/#{FileType.find(@app_file[:file_type_id])[:tipo]}/#{@app_file[:ruta]}")
      render json: @app_file, status: deleted, location: @app_file
    else
      render json: @app_file.errors, status: :unprocessable_entity
    end
  end
  
  private
    def set_app_files
      @app_file = AppFile.find(params[:id])
    end
    
    def app_file_params
      params.require(:app_file).permit(:id,:ruta,:file_type_id,:user_id,:post_id,:description)
    end
end