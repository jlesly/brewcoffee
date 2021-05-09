class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def new
        if params[:brew_id] && @brew = Brew.find_by_id([:brew_id])
            @comment = @brew.comments.new
        else
            @error = "Comment does not exist" if params[:brew_id]
            @comment = Comment.new
        end
    end  

    def show
        @comment = Comment.find(params[:id])
    end 

    def index
        if params[:brew_id] && @brew = Brew.find_by_id(params[:brew_id])
            @comments = @brew.comments
        elsif current_user
            @comments = current_user.comments.all
        else
            @error = "Coffee brew entry does not exist" if params [:brew_id]
            @comments = Comment.all
        end
    end 

    def create
        @brew = Brew.find(params[:comment][:brew_id])
        @comment = current_user.comments.new(comment_params)

        if @comment.save
            redirect_to brew_comment_path(@brew, @comment)
        else
            @error = @comment.errors.full_messages
            render :edit
        end 
    end

    def edit
        @comment = Comment.find(params[:id])
    end 

    def update
        @comment = current_user.comments.find(params[:id])

        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            @error = @comment.errors.full_messages
            render :edit
        end
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        if @comment.destroy
            flash[:success] = "Comment successfully deleted"
            redirect_to brews_path
        else
            @error = @comment.errors.full_messages
            render :edit
        end
    end 


    private
    def comment_params
        params.require(:comment).permit(:content, :brew_id, :user_id)
    end

end
