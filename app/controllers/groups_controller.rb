class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  def index
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      #------------------------------------------------------------------------------------------------------
      #@groups = Group.paginate(:page => params[:page], :per_page => 2)
      #@groups = Group.nameSons
      #@groups = Group.selectIdName
      #@groups = Group.groupsUseropluckIdName
     #id=User.find(params[:id])
     #@groups= Group.gu(id)
      if params[:groupsUserbyname] != nil
      nombre=User.paginate(:page => params[:page],:per_page => params[:per_page]).find_by_name(params[:groupsUserbyname]).name
      @groups= Group.gu2(nombre)

      elsif params[:groupsUserbyid] != nil
        id=User.paginate(:page => params[:page],:per_page => params[:per_page]).find_by_id(params[:groupsUserbyid]).id
        @groups= Group.gu(id)

      elsif params[:name] != nil
         @groups = Group.nameGroup(params[:name]).paginate(:page => params[:page],:per_page => params[:per_page])
      else
        @groups =Group.paginate(:page => params[:page],:per_page => params[:per_page])
      end
      render json: @groups
      #--------------------------------------------------------------------------------------------------------------
    else
      render json: false
    end
  end

  # GET /groups/1
  def show
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      render json: @group
    else
      render json: false
    end
  end

  # POST /groups
  def create
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      #-----------------------------------------------------------------------------------
      @group = Group.new(group_params)

      if @group.save
        render json: @group, status: :created, location: @group
      else
        render json: @group.errors, status: :unprocessable_entity
      end
      #-------------------------------------------------------------------------------
    else
      render json: false
    end
  end

  # PATCH/PUT /groups/1
  def update
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      #-------------------------------------------------------------------------------------
      if @group.update(group_params)
        render json: @group
      else
        render json: @group.errors, status: :unprocessable_entity
      end
      #------------------------------------------------------------------------------------
    else
      render json: false
    end
  end

  # DELETE /groups/1
  def destroy
    if token_auth(request.headers["Authorization"],request.headers["ID"])
      
      @group.destroy
    else
      render json: false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:name)
    end
end
