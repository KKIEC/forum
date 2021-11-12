class UsersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all.order(:name)
  end

  def show

    @joined_on = @user.created_at.to_s(:short)

    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_s(:short)
    else
      @last_login = 'never'
    end

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

    successfullly_updated = if needs_password?(@user, user_params)
                              @user.update(user_params)
                            else
                              @user.update_without_password(user_params)
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
        :role_id,
      )
    end

    def needs_password?(_user, params)
      params[:password].present?
    end

end
