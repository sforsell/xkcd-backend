class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user.comics.to_json
    else
      render :nothing => true
    end
  end

  def create
    user = User.find_by(id: params[:user_id])
    if user.nil?
      user = User.new()
      user.save
    end
    comic = user.comics.find_by(num: params[:num])
    if comic.nil?
      comic = user.comics.new()
      comic.num = params[:num]
      comic.img_url = params[:img]
      comic.title = params[:title]
      comic.save
    end
    render json: user.to_json
  end

  def destroy
    comic = comic.find_by(num: params[:num], user: User.find_by(id: params[:user_id]))
    comic.destroy
  end

end
