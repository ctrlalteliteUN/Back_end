class ArchivosController < ApplicationController
  # GET /archivos
  def index
    @archivos = Archivo.all

    render json: @archivos
  end

  # GET /archivos/1
  def show
    @operacion = send_file("files/#{FileType.find(Archivo.find(params[:id])[:file_type_id])[:tipo]}/#{Archivo.find(params[:id])[:ruta]}",
  :filename => Archivo.find(params[:id])[:ruta],
  :type => "'archivo'")
    if @operacion
      render json: @operacion,status: 200, location: @archivo
    else
      render json: @operacion.errors, status: :unprocessable_entity
    end
  end

  # POST /archivos
  def create
    @archivo = Archivo.new(archivo_params)

    if @archivo.save
      @archivo.crear_archivo_disco
      render json: @archivo, status: :created, location: @archivo
    else
      render json: @archivo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /archivos/1
  def destroy
    File.delete("files/#{FileType.find(Archivo.find(params[:id])[:file_type_id])[:tipo]}/#{Archivo.find(params[:id])[:ruta]}") if File.exist?("files/#{FileType.find(Archivo.find(params[:id])[:file_type_id])[:tipo]}/#{Archivo.find(params[:id])[:ruta]}")
    Archivo.find(params[:id]).destroy
  end
  
  private
    def archivo_params
      params.require(:archivo).permit(:ruta,:file_type_id,:user_id,:post_id)
    end
end
