class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
  
    # GET /comments or /comments.json
    def index
        @comments = @post.comments
    end
  
    # GET /comments/1 or /comments/1.json
    def show
    end
  
    # GET /comments/new
    def new
      @comment = @post.comments.new
    end
  
    # GET /comments/1/edit
    def edit
    end
  
    # POST /comments or /comments.json
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(params[:comment].permit(:comment))
      @comment.name = current_user.email
      if @comment.save
        respond_to do |format| 
          format.json{
            render :show, status: :created, location: @comment
          }
      @comment.save
    end
  
    # PATCH/PUT /comments/1 or /comments/1.json
    def update
      @post.comments.update(comment_params)
    end
  
    # DELETE /comments/1 or /comments/1.json
    def destroy
      @comment.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def comment_params
        params.require(:comment).permit(:comment)
      end
  end