class TopicsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_categories, only: %i[new create edit update index]

  def index
    @topics = Topic.paginate(page: params[:page], per_page: 3)
  end

  def show
    @user = @topic.user
    @associated_posts = @topic.posts.paginate(page: params[:page], per_page: 3)
  end

  def new; end

  def edit; end

  def create
    @topic.user_id = current_user.id

    if @topic.save
      redirect_to @topic, notice: 'Topic was successfully created.'
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'Topic was successfully destroyed.'
  end

  private

  def set_categories
    @categories = Category.order(:name)
  end

  def topic_params
    params.require(:topic).permit(
      :name,
      :description,
      :user_id,
      { category_ids: [] }
    )
  end
end
