class UsersController < ApplicationController
 
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :correct_user, only: [:show] 
  
  def index
   
  end

  def show
    @user = User.find(params[:id])
    @items = current_user.items
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @pagy, @wish_items = pagy(@user.wish_items)
    counts(@user)
  end
  
  private
  
  def correct_user
    if  current_user.id.to_s != params[:id]
        flash[:danger] = 'アクセス権がありません'
        redirect_to root_url
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
