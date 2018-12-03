class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy]

  # GET /services
  def index
    if $granted
      $granted = false
      @services = Service.all
      render json: @services
    else
      render json: $granted
    end
    #------------------------------------------------------------------------

    #Service.create( score: 3, post_id: 1)
    #@services = Service.create( score: 3, post_id: 1)

    #---------------------------------------------------------------------------
  end

  # GET /services/1
  def show
    if $granted
      $granted = false
      render json: @service
    else

    end
    render json: $granted

  end

  # POST /services
  def create
    if $granted
      $granted = false



      #--------------------------------------------------------------------------------------
      @service = Service.new(service_params)

      if @service.save
        service_has_user = ServiceHasUser.new(@service[:id],params[:user_service_id])
        if service_has_user.save
          render json: @service, status: :created, location: @service
        else
          render json: @service.errors, status: :unprocessable_entity
        end
      else
        render json: @service.errors, status: :unprocessable_entity
      end
    else
      render json: $granted
    end

    #--------------------------------------------------------------------------------------
  end

  # PATCH/PUT /services/1
  def update
    if $granted
      $granted = false

      #---------------------------------------------------------------------------------------
      if @service.update(service_params)
        render json: @service
      else
        render json: @service.errors, status: :unprocessable_entity
      end
      #-------------------------------------------------------------------------------------
    else
      render json: $granted
    end
  end

  # DELETE /services/1
  def destroy
    if $granted
      $granted = false
      @service.destroy
    else
      render json: $granted
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def service_params
    params.require(:service).permit(:score, :post_id)
  end
end