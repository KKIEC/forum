class UsersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :not_delete_last_admin, only: :destroy

  def index
    @users = User.all.order(:name)
  end

  def show; end

  def new; end

  def edit; end

  def create
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    if successfullly_updated
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

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :role
    )
  end

  def needs_password?(params)
    params[:password].present?
  end

  def successfullly_updated
    if needs_password?(user_params)
      @user.update(user_params)
    else
      @user.update_without_password(user_params)
    end
  end

  def not_delete_last_admin
    @user = User.find(params[:id])
    return unless (User.where(role: 'admin').count <= 1) && (@user.role == 'admin')

    redirect_to users_url
    flash[:error] = 'You want to destroy the last admin!!!'
  end
end
