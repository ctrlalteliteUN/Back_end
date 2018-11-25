class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :update, :destroy]

  # GET /records
  def index
    if $granted
      $granted = false
      @records = Record.all
      render json: @records
    else
      render json: $granted
    end
  end

  # GET /records/1
  def show
    if $granted
      $granted = false
      render json: @record
    else
      render json: $granted
    end
  end

  # POST /records
  def create
    if $granted
      $granted = false
      #------------------------------------------------------------------------------------
      @record = Record.new(record_params)

      if @record.save
        render json: @record, status: :created, location: @record
      else
        render json: @record.errors, status: :unprocessable_entity
      end
      #---------------------------------------------------------------------------------
    else
      render json: $granted
    end
  end

  # PATCH/PUT /records/1
  def update
    if $granted
      $granted = false
      #----------------------------------------------------------------------
      if @record.update(record_params)
        render json: @record
      else
        render json: @record.errors, status: :unprocessable_entity
      end
      #----------------------------------------------------------------------
    else
      render json: $granted
    end
  end

  # DELETE /records/1
  def destroy
    if $granted
      $granted = false
      @record.destroy
    else
      render json: $granted
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
