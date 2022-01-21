class MaterialController < ApplicationController
    def new
        @material = Material.new 
    end

    def create
        begin
            @material_paramms = params.require(:material).permit(:name, :price, :unity, :category, :description, :code)
            @material = Material.create(@material_paramms)
            if @material.save
                redirect_to materialIndex_path, success: "Material Registrado" 
            else
                raise "Error al registrar el material: #{@material.errors.full_messages.to_sentence}." 
            end
        rescue Exception => ex
            puts ex
            redirect_to materialIndex_path, error: ex 
        end      
    end

    def update
        begin
            @material = Material.find(params[:id])
            @material_paramms = params.require(:material).permit(:name, :price, :unity, :category, :description, :code)
            if @material.update(@material_paramms)
                redirect_to materialIndex_path, success: "Material Editado"
            else
                raise "Error al editar el material: #{@material.errors.full_messages.to_sentence}." 
            end
        rescue Exception => ex
            puts ex
            redirect_to materialIndex_path, error: ex  
        end
    end

    def index 
        @materials = Material.all
        @material = Material.new
    end

    def delete 
        begin
            material = Material.find(params[:materialId])
            material.destroy
            redirect_to materialIndex_path, success: "Material Eliminado" 
        rescue Exception => ex
            puts ex
            redirect_to materialIndex_path, error: ex 
        end
        
    end
end
