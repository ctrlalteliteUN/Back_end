class AppFilesController < ApplicationController
  before_action :set_app_files, only: [:show, :update, :destroy]
  # GET /app_files
  def index
    if params[:ProfilePhoto].present?
      if params[:user_id] != nil
        consulta = AppFile.foto_perfil(params[:user_id])
        if !consulta.blank?
          render json: output = {'ruta' => consulta[0][:ruta]}.to_json
          #operacion = send_file("files/#{FileType.find(consulta[0][:file_type_id])[:tipo]}/#{consulta[0][:ruta]}",
        #:filename => consulta[0][:ruta],
        #:type => "'application/png'")
        else
          render json: output = {'error' => 'El usuario no existe o no tiene foto de perfil almacenada'}.to_json
        end
      else
        render json: output = {'error' => 'Especifique la id del usuario'}.to_json
      end
    elsif params[:FileType].present?
      if params[:user_id].present?
        if params[:post_id].present?
          #id usuario y post
          if params[:stream].present?
          else
            render json: AppFile.where(file_type_id:params[:FileType],user_id:params[:user_id],post_id:params[:post_id])
          end
        else
          #solo por id usuario
          file = AppFile.where("file_type_id= ? AND user_id = ?", params[:FileType], params[:user_id])
          if params[:stream].present?
            send_data(Base64.decode64(file[0][:ruta]), :type => "application/pdf" ,:filename => "pdf.pdf", disposition: 'attachment', stream: 'true')
          else
            render json: file
          end
        end
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
    #@operacion = send_file("files/#{FileType.find(@app_file[:file_type_id])[:tipo]}/#{@app_file[:ruta]}",
  #:filename => @app_file[:ruta],
  #:type => "'application/png'")
    render json: output = {'ruta' => consulta[0][:ruta]}.to_json
  end

  # POST /app_files
  def create
    @archivo = AppFile.new(app_file_params)

    if @archivo.save
      #@archivo.crear_archivo_disco
      render json: @archivo, status: :created, location: @archivo
    else
      render json: @archivo.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /app_files/1
  def update
    if @app_file.update(app_file_params)
      #@app_file.crear_archivo_disco
      render json: @app_file, status: :updated, location: @app_file
    else
      render json: @app_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /app_files/1
  def destroy
    if @app_file.destroy
      #File.delete("files/#{FileType.find(@app_file[:file_type_id])[:tipo]}/#{@app_file[:ruta]}") if File.exist?("files/#{FileType.find(@app_file[:file_type_id])[:tipo]}/#{@app_file[:ruta]}")
      render json: @app_file, status: :deleted, location: @app_file
    else
      render json: @app_file.errors, status: :unprocessable_entity
    end
  end
  
  private
    def set_app_files
      @app_file = AppFile.find(params[:id])
    end
    
    def app_file_params
      params.require(:app_file).permit(:id,:ruta,:file_type_id,:user_id,:post_id,:description,:titulo)
    end
end