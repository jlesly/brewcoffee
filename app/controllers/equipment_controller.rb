class EquipmentController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @equipments = Equipment.alpha
    end 

end
