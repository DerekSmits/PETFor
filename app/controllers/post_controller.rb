class PostController < ApplicationController
    def index
        @posts = Post.all
    end
    def show
        return "#{Post.title}"
    end
end
