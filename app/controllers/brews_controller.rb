class BrewsController < ApplicationController

    def new 
        @brew = Brew.new
    end 

    def create
        @brew = current_user.brews.build(brew_params)
        if @brew.save
            redirect_to brew_path(@brew)
        else
            render :new

        end 
    end

    
end
