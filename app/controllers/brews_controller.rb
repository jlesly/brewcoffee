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
    
    def index
    end

    def show
        @brews = Brews.find_by_id(params[:id])
    end 

    def update 
        @brews = current_user.brews.find(params[:id])

        if @brews.update(brew_params)
            redirect_to brew_path(@brew)
        else
           # add error 
            render :edit
        end
    end 

    private

    def brew_params
        params.require(:brew).permit(:name, :brand, :grind_size, :dose, :extraction_volume, :extraction_time)
    end 

end