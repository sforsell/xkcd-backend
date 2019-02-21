class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:user_id])
    if user
      render json: user.comics.to_json
    else
      head :ok
    end
  end

  def create
    user = User.new
    user.save
    render json: user.to_json
  end
  
end
