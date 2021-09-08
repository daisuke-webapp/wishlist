class GoodsController < ApplicationController
  def search
    if params[:keyword] && params[:keyword].length <= 1 
       flash.now[:danger] = '2文字以上入力してください'
    elsif params[:keyword]
      @goods = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
      
    end
  end
end
