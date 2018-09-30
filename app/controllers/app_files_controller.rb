class AppFilesController < ApplicationController
  # GET /app_files
  def index
    @archivos = AppFile.all

    render json: @archivos
  end

  # GET /app_files/1
  def show
    @operacion = send_file("files/#{FileType.find(AppFile.find(params[:id])[:file_type_id])[:tipo]}/#{AppFile.find(params[:id])[:ruta]}",
  :filename => AppFile.find(params[:id])[:ruta],
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

  # DELETE /app_files/1
  def destroy
    File.delete("files/#{FileType.find(AppFile.find(params[:id])[:file_type_id])[:tipo]}/#{AppFile.find(params[:id])[:ruta]}") if File.exist?("files/#{FileType.find(AppFile.find(params[:id])[:file_type_id])[:tipo]}/#{AppFile.find(params[:id])[:ruta]}")
    AppFile.find(params[:id]).destroy
  end
  
  private
    def app_file_params
      params.require(:app_file).permit(:ruta,:file_type_id,:user_id,:post_id)
    end
end