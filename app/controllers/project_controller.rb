class ProjectController < ApplicationController
    def new
        @project = Project.new 
    end

    def create
        begin
            @project_paramms = params.require(:project).permit(:name, :location, :date, :materialsFactor, :workForceFactor, :generalExpensesFactor, :utilitiesFactor)
            @project = Project.create(@project_paramms)
            if @project.save
                redirect_to projectIndex_path, success: "Presupuesto Registrado"
            else
                raise "Error al crear el proyecto: #{@project.errors.full_messages.to_sentence}." 
            end
        rescue Exception => ex
            puts ex
            redirect_to projectIndex_path, error: ex 
        end
    end

    def index
        @projects = Project.all 
        @project = Project.new(materialsFactor: 1, workForceFactor: 1, generalExpensesFactor: 1, utilitiesFactor: 1)
    end

    def show
        @project = Project.find(params[:id])
        @items = @project.items.where('"items"."isMain" = true')
        @items = @items.sort_by { |item| item.index}
        @item = Item.new
        @materials = Material.all
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        begin
            @project = Project.find(params[:id])
            @project_paramms = params.require(:project).permit(:name, :location, :date, :materialsFactor, :workForceFactor, :generalExpensesFactor, :utilitiesFactor)
            if @project.update(@project_paramms)
                redirect_to projectIndex_path, success: "Presupuesto Editado"
            else
                raise "Error al editar el proyecto: #{@project.errors.full_messages.to_sentence}." 
            end
        rescue Exception => ex
            puts ex
            redirect_to projectIndex_path, error: ex 
        end
    end

    def delete
        begin
            @project = Project.find(params[:id])
            @project.destroy
            redirect_to projectIndex_path, success: "Presupuesto Eliminado"
        rescue Exception => ex
            puts ex
            redirect_to projectIndex_path, error: ex 
        end

    end

    def report
        @project = Project.find(params[:id])
        @items = helpers.projectItems(@project)
        render layout: false
    end

    def materials
        @expenses = []
        @materials = []
        @project = Project.find(params[:id])
        helpers.projectMaterials(@project)
    end
end
