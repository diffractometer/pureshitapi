class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @posts = Post.all
    render json: {
      status: "success",
      data: @posts
    }
  end

  def show
    render json: {
      status: "success",
      data: @post
    }
  end

  def new
    @data = Post.new
    render json: {
      status: "success",
      data: @data
    }
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
        return render json: {
          status: "success",
          data: @post
        }
    else
        return render json: {
          status: "failure",
          errors: @post.errors.messages
        }, status: "400"
    end
  end

  def update
    if @post.update(post_params)
      return render json: @post
    else
      return render json: {
        status: "failure",
        errors: @post.errors.messages
      }, status: "400"
    end
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:id, :title, :body, :user_id)
    end
end
