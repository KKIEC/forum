class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show

    if @user.categories.empty?
      @associated_categories = 'None'
    else
      @associated_categories = @user.categories.map(&:name).join(', ')
    end

    if @user.topics.empty?
      @associated_topics = 'None'
    else
      @associated_topics = @user.topics.map(&:name).join(', ')
    end

  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :role_id)
    end

end
