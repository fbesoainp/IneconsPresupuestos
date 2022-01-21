class ApplicationController < ActionController::Base
    before_action :set_variables
    add_flash_types :info, :error, :warning, :success

    def set_variables
    @categories = [
        'Materiales',
        'Mano de Obra',
        'Transporte'
    ]
    end
end
