class ItemsController < ApplicationController
  before_action :login_check, only: [:create]
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  before_action :registered, only: [:create]
    
  def create
    item = current_user.items.build(item_params)
    if item.save
      flash[:success] = 'リストに追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'リストへの追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @item.destroy
    flash[:success] = 'リストから削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def login_check
    unless logged_in?
      flash[:danger] = "リストに追加できるのはログインユーザーのみです"
      redirect_to login_path
    end
  end
  
  def registered
    if current_user.items.find_by(item_code: params[:item][:item_code])
      flash[:danger] = 'リストに登録済みのアイテムです'
      redirect_back(fallback_location: root_path)
    end
  end
  
  # Strong Parameter
  def item_params
    params.require(:item).permit(:image_url, :name, :url, :price, :item_code)
  end
  
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_url
    end
  end
end
