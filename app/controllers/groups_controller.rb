class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  def index
    if $granted
      $granted = false
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
      render json: $granted
    end
  end

  # GET /groups/1
  def show
    if $granted
      $granted = false
      render json: @group
    else
      render json: $granted
    end
  end

  # POST /groups
  def create
    if $granted
      $granted = false
      #-----------------------------------------------------------------------------------
      @group = Group.new(group_params)

      if @group.save
        render json: @group, status: :created, location: @group
      else
        render json: @group.errors, status: :unprocessable_entity
      end
      #-------------------------------------------------------------------------------
    else
      render json: $granted
    end
  end

  # PATCH/PUT /groups/1
  def update
    if $granted
      $granted = false
      #-------------------------------------------------------------------------------------
      if @group.update(group_params)
        render json: @group
      else
        render json: @group.errors, status: :unprocessable_entity
      end
      #------------------------------------------------------------------------------------
    else
      render json: $granted
    end
  end

  # DELETE /groups/1
  def destroy
    if $granted
      $granted = false
      @group.destroy
    else
      render json: $granted
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
