class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @posts = user.posts
    @nickname = user.nickname
    @likes = Like.where(user_id: user.id).all
  end

end
