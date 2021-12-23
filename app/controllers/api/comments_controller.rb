class Api::CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
  
    # GET /comments or /comments.json
    def index
        @comments = @post.comments..paginate(page: params[:page], per_page: 10)
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
      @comment = @post.comments.create!(params[:comment].permit(:comment).merge(name: currnet_user.email))
      @comment.name = current_user.email
      if @comment.save
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
      @comment.save
    end
  
    # PATCH/PUT /comments/1 or /comments/1.json
    def update
      @post.comments.update!(params[:comment].permit(:comment))
      if @post.comments.update(params[:comment].permit(:comment))
        super
      end
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