class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.search(params[:search])
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      respond_to do |format| 
        format.json{
          render :show, status: :created, location: @comment
        }
      end
    else
      respond_to do |format|
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    @post.save
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.update(post_params)
    if @post.update(post_params)
      respond_to do |format| 
        format.json{
          render :show, status: :created, location: @comment
        }
      end
    else
      respond_to do |format|
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
