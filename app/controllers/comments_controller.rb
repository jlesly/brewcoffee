class CommentsController < ApplicationController
    def new
        if params[:brew_id] && @brew = Brew.find_by_id([:brew_id])
            @comment = @brew.comments.new
        else
            # add error code after adding error code in layout
            @comment = Comment.new
        end
    end  

    def show
        @comment = Comment.find(params[:id])
    end 

    def index
    end 

    def create
        @brew = Brew.find(params[:comment][:brew_id])
        @comment = current_user.comments.new(comment_params)

        if @comment.save
            redirect_to brew_comment_path(@brew, @comment)
        else
            # add error code after adding error code in layout
            render :edit
        end 
    end

    def edit
        @comment = Comment.find(params[:id])
    end 

    def update
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        if @comment.destroy
            flash[:success] = "Comment successfully deleted"
            redirect_to brews_path
        else
            # add error code after adding error code in layout
            render :edit
        end
    end 


    private
    def comment_params
        params.require(:comment).permit(:content, :brew_id, :user_id)
    end

end
