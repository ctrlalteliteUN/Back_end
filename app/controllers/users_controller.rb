class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /posts
  def index


      if params[:name] != nil

      @users = User.users1(params[:name]).paginate(:page => params[:page],:per_page => params[:per_page])

      elsif params[:email] != nil

        @users = User.userse(params[:email]).paginate(:page => params[:page],:per_page => params[:per_page])
      else
        @users = User.paginate(:page => params[:page],:per_page => params[:per_page])
        #@users = User.gmailEmail
        #@users = User.selectNameEmail.as_json(except: [:authentication_token])
        #@users = User.usersServiceFutbolpluckIdEmail
        #@users = User.usersServiceFutbolpluckIdEmail
      end
      render json: @users


  end

  # GET /posts/1
  def show
    render json: @user
  end

  # POST /posts
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_id, :title, :body, :password_confirmation, :password, :perimission_level,:email,:name)
    end
end
