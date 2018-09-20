class PostsController < ApplicationController

  # GET /posts
  def index
    @users = User.all

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

    # Only allow a trusted parameter "white list" through.
    def user_params
      #params.require(:post).permit(:user_id, :title, :body, :solicitud)
    end
end
