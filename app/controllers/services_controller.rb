class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy]

  # GET /services
  def index
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      @services = Service.all
      render json: @services
    else
      render json: false
    end
    #------------------------------------------------------------------------

    #Service.create( score: 3, post_id: 1)
    #@services = Service.create( score: 3, post_id: 1)

    #---------------------------------------------------------------------------
  end

  # GET /services/1
  def show
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      @service = Service.find(params[:id])
      render json: @service
    else
      render json: false
    end
    

  end

  # POST /services
  def create
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      #--------------------------------------------------------------------------------------
      @service = Service.new(service_params)

      if @service.save
        service_has_user1 = ServiceHasUser.new()
        service_has_user2 = ServiceHasUser.new()
        service_has_user1[:service_id] = @service[:id]
        service_has_user1[:user_id] = params[:user_service_id]
        service_has_user1[:score] = params[:score_post]
        service_has_user2[:service_id] = @service[:id]
        service_has_user2[:user_id] = Post.find(@service[:post_id])[:user_id]
        service_has_user2[:score] = params[:score_service]
        if service_has_user1.save && service_has_user2.save
          render json: @service, status: :created, location: @service
        else
          render json: @service.errors, status: :unprocessable_entity
        end
      else
        render json: @service.errors, status: :unprocessable_entity
      end
    else
      render json: false
    end

    #--------------------------------------------------------------------------------------
  end

  # PATCH/PUT /services/1
  def update
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      

      #---------------------------------------------------------------------------------------
      if @service.update(service_params)
        relaciones = ServiceHasUser.where(service_id:@service[:id])
        service_has_user1 = relaciones[0]
        service_has_user2 = relaciones[1]
        service_has_user1[:service_id] = @service[:id]
        service_has_user1[:user_id] = params[:user_service_id]
        service_has_user1[:score] = params[:score_post]
        service_has_user2[:service_id] = @service[:id]
        service_has_user2[:user_id] = Post.find(@service[:post_id])[:user_id]
        service_has_user2[:score] = params[:score_service]
        if service_has_user1.save && service_has_user2.save
          render json: @service
        else
          render json: @service.errors, status: :unprocessable_entity
        end
      else
        render json: @service.errors, status: :unprocessable_entity
      end
      #-------------------------------------------------------------------------------------
    else
      render json: false
    end
  end

  # DELETE /services/1
  def destroy
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      @service.destroy
    else
      render json: false
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def service_params
    params.require(:service).permit(:score, :post_id,:state)
  end
end