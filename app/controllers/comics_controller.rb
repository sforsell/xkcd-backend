class ComicsController < ApplicationController

  def create
    user = User.find_by(id: params[:user_id])
    comic = user.comics.find_by(num: params[:num])
    if comic.nil?
      comic = user.comics.new
      comic.num = params[:num]
      comic.img_url = params[:img]
      comic.title = params[:title]
      comic.save

      head :ok
    end
  end
  
  def destroy
    comic = Comic.find_by(num: params[:id], user: User.find_by(id: params[:user_id]))
    if comic
    	comic.destroy
    	head :ok
    end	
  end


end