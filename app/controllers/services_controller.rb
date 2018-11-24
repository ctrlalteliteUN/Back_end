class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy]

  # GET /services
  def index
    @services = Service.all
    #Service.create( score: 3, post_id: 1)
    #@services = Service.create( score: 3, post_id: 1)
    render json: @services
  end

  # GET /services/1
  def show

    render json: @service
  end

  # POST /services
  def create
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
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
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
