class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:profile, :download, :show_orders, :show_scenarios, :logout] #UPDATE----->
  before_filter :not_available_for_user, :only => [:create, :user_link, :save_user, :login_attempt]
  def login_attempt
    @user = User.exist(user_params[:username], user_params[:password])
    if ((@user!=nil)&& (@user.email_confirmation==true))
      session[:user_id] = @user.id
      redirect_to '/users/profile'
    else
      redirect_to '/home/login'
    end
  end

  def create
  	@user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
  if @user.save
      UserMailer.notify_user(@user).deliver_now
    else
      render '/home/signup'
    end
  end
  def user_link
    @user = User.new
  end
  def save_user
    @user = User.find(params["user"]["id"])
  if @user
      session[:user_id] = params["user"]["id"]
      @user.update(:email_confirmation => true)  
      redirect_to '/users/profile'
    else
      redirect_to '/users/user_link'
    end
  end
  def profile
  end
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
  
  def show_orders
    @user = User.find(session[:user_id])
    @orders = @user.orders
  end

  def show_scenarios
    @movies = Movie.all
  end
  
  def download
    @movie_scenario_url = params["file_url"]
    send_file @movie_scenario_url
  end  

  private 
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
