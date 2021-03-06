class PostsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_topic, only: %i[show update destroy]
  before_action :set_topic_ref, only: %i[edit create update]

  def show
    @user = @post.user
  end

  def new
    @topic_ref = params[:topic_ref]
  end

  def edit; end

  def create
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post.topic, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @associated_topic, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to @associated_topic, notice: 'Topic was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(
      :name,
      :body,
      :user_id,
      :topic_id
    )
  end

  def set_topic
    @associated_topic = @post.topic
  end

  def set_topic_ref
    @topic_ref = @post.topic_id
  end
end
