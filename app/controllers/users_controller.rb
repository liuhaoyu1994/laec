class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @projects  = @articles
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
            redirect_to @user

    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the LAEC!"
      redirect_to @user
    else
      render 'new'
    end
  end
 
  def index
    @users = User.all
    @users_senior = User.where("department = 1")
    @users_students = User.where("department = 2")
    @users_members = User.where("department = 3")
    @users_coop = User.where("department = 4")

  end
 
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password,
                                   :password_confirmation, :title, :department, :image, :tel, :bio)
    end
    
  
    
end
