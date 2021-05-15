class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def index
        @user = User.find_by_id(params[:id])
    end 

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end 

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

    
end
