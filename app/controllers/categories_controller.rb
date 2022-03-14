class CategoriesController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @categories = Category.order('name ASC').paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = @category.user
    @associated_topics = @category.topics.order('name ASC').paginate(
      page: params[:page],
      per_page: 3
    )
  end

  def new; end

  def edit; end

  def create
    @category.user_id = current_user.id

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end
