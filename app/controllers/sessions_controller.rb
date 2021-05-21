class SessionsController < ApplicationController

    def welcome
        @user = User.find_by_id(params[:id])
    end 

    def create
        @user = User.find_or_create_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:error] = "Login failed. Please try again or sign up!"
          redirect_to '/login'
        end
    end 
    
    def destroy
        session.delete :user_id
        redirect_to '/'
    end 

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private
      
    def auth
        request.env['omniauth.auth']
    end
end
