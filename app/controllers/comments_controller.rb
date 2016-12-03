class CommentsController < ApplicationController

    def index
    end

    def show
    end

    def new
    end

    def create
        @comment = Comment.new(comment_params)
        if Comment.save(@comment)
            redirect_to customer_path(@comment.customer_id)
        else
            redirect_to customer_path(@comment.customer_id)
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def comment_params
        params.require(@comment).permit(:body, :customer_id)
    end
end
