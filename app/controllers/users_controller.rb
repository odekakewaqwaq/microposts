class UsersController < ApplicationController
  before_action :show, only: [:edit, :update]
  
  def show
    @user =User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ="Welcome to the sample App"
      redirect_to @user
    else 
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update (user_params)
      flash[:success] = "プロフィールを編集しました"
      redirect_to user_path
    else
      #保存に失敗した場合は編集画面に戻す
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:location,:profile)
  end
end
