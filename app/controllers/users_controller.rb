require "#{Rails.root}/app/pdfs/user_pdf.rb"
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # GET /posts
  def index

      if params[:name] != nil

      @users = User.users1(params[:name]).paginate(:page => params[:page],:per_page => params[:per_page])

      elsif params[:email] != nil

        @users = User.userse(params[:email]).paginate(:page => params[:page],:per_page => params[:per_page])
      elsif params[:selectNameEmail] =="1"
        #@users = User.paginate(:page => params[:page],:per_page => params[:per_page])
        #@users = User.gmailEmail.paginate(:page => params[:page],:per_page => params[:per_page])

        @users = User.selectNameEmail.paginate(:page => params[:page],:per_page => params[:per_page]).as_json(except: [:authentication_token])
        #@users = User.usersServiceFutbolpluckIdEmail.paginate(:page => params[:page],:per_page => params[:per_page])
        #@users = User.usersServiceFutbolpluckIdEmail.paginate(:page => params[:page],:per_page => params[:per_page])
      else
        @users = User.paginate(:page => params[:page],:per_page => params[:per_page])
      end
      render json: @users


  end

  # GET /posts/1
  def show



    cantidad = User.cshu(params[:id])
    @cantidad2 = User.cshu2(params[:id]).as_json

    acumulado = 0.0
    total = 0.0
    no_null_c = 0.0
    for i in 0..(cantidad -1)
      if @cantidad2[i]["score"] != nil
        no_null_c = no_null_c +1
        acumulado = acumulado + @cantidad2[i]["score"]

      end

    end
    total = acumulado / no_null_c
    puts total

    @user.score = total

    respond_to do |format|

      format.html do
        if params[:statistics] != nil
          if params[:statistics] == "1"
            #render json: output = {'x' => "#{(User.last_week_posts(@user[:id])).keys}",'y' => "#{(User.last_week_posts(@user[:id])).values.join(",")}"}.to_json
            render json: User.last_week_posts(@user[:id])
          elsif params[:statistics] == "2"
            render json: User.last_week_comments(@user[:id])
            #render json: output = {'x' => "#{(User.last_week_comments(@user[:id])).keys}",'y' => "#{(User.last_week_comments(@user[:id])).values.join(",")}"}.to_json
         # elsif params[:statistics] == "3"
          #  render json: User.most_used_Tags(@user[:id]).to_json
          end

        else

          render json: @user


        end
      end


      format.pdf do
        pdf = UserReport.new(params[:id])
        send_data pdf.render,
          filename: "report.pdf",
          type: 'application/pdf',
          disposition: 'inline'
      end
    end

    #render json: @user
  end

  # POST /posts
  def create
    @user = User.new(user_params)

    if @user.save
     #UserMailer.with(user: @user).welcome_email.deliver_later
      #UserMailer.with(user: @user).welcome_email
      DelayUserWelcomeJob.new(@user).enqueue(wait: 10.seconds)
      OneWeekUserJob.new(@user).enqueue(wait: 1.weeks)
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
    UserMailer.with(user: @user,reason:params[:reason]).closed_account.deliver_later
    @user.destroy
  end
  
  
  
  #verificar token de mierda
  def token_verify

    #render json: {id: params["user"]["id"], params: params}
    
    user_tmp = User.find(params[:id])
    if user_tmp.authentication_token == params[:authentication_token]
      $granted = true
      render json: false
    else
      
      render json: false
    end
  end



  private
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_id, :title, :body, :password_confirmation, :password, :perimission_level,:email,:name,:score)
    end
end
