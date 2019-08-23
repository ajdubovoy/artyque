class NewsPostsController < ApplicationController
  include MarkdownHelper
  before_action :set_news_post, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[show]
  after_action :skip_authorization, only: %i[show]

  def show;end

  def new
    @news_post = NewsPost.new
    authorize_news_post
  end

  def create
    @news_post = NewsPost.new(news_post_params)
    authorize_news_post
    if @news_post.save
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def edit
    authorize_news_post
  end

  def update
    authorize_news_post
    if @news_post.update(news_post_params)
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  private

  def set_news_post
    @news_post = NewsPost.find(params[:id])
  end

  def authorize_news_post
    authorize @news_post
  end

  def news_post_params
    params.require(:news_post).permit(:headline, :photo, :content)
  end
end
