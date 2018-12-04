class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :update, :destroy]

  # GET /records
  def index
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      @records = Record.all
      render json: @records
    else
      render json: false
    end
  end

  # GET /records/1
  def show
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      render json: @record
    else
      render json: false
    end
  end

  # POST /records
  def create
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      #------------------------------------------------------------------------------------
      @record = Record.new(record_params)

      if @record.save
        render json: @record, status: :created, location: @record
      else
        render json: @record.errors, status: :unprocessable_entity
      end
      #---------------------------------------------------------------------------------
    else
      render json: false
    end
  end

  # PATCH/PUT /records/1
  def update
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      #----------------------------------------------------------------------
      if @record.update(record_params)
        render json: @record
      else
        render json: @record.errors, status: :unprocessable_entity
      end
      #----------------------------------------------------------------------
    else
      render json: false
    end
  end

  # DELETE /records/1
  def destroy
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      @record.destroy
    else
      render json: false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def record_params
      params.require(:record).permit(:user_id, :service_id)
    end
end
