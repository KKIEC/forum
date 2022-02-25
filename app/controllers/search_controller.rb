class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.search(params[:search])
    @topics = Topic.search(params[:search])
    return unless current_user.admin?

    @posts = Post.search(params[:search])
    @users = User.search(params[:search])
  end
end
