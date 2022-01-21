class ItemController < ApplicationController
    def new
        @item = Item.new 
    end

    def create
        begin
            @item_paramms = params.require(:item).permit(:name, :project_id, :index, :isMain, :item_id)
            @item = Item.create(@item_paramms)
            if @item.save
                redirect_to projectShow_path(@item.project_id)
            else
                raise "Error al crear Item: #{@item.errors.full_messages.to_sentence}."
            end
        rescue Exception => ex
            puts ex 
            redirect_to projectShow_path(@item.project_id), error: ex
        end
    end

    def update
        begin
            @item = Item.find(params[:itemId])
            @item_paramms = params.require(:item).permit(:name, :index)
            if @item.update(@item_paramms)
                redirect_to projectShow_path(@item.project_id), success: "Presupuesto Editado"
                
            else
                raise "Error al crear Item: #{@item.errors.full_messages.to_sentence}."
            end
        rescue Exception => ex
            puts ex
            redirect_to projectShow_path(@item.project_id), error: ex
        end
    end

    def delete
        begin
            item = Item.find(params[:itemId])
            projectId =item.project_id
            helpers.indexUpdate(item)
            item.destroy
            redirect_to projectShow_path(projectId)
        rescue Exception => ex 
            puts "Error: #{ex}" 
        end
    end

    def expense
        @item = Item.find(params[:itemId])
        @expense = Expense.new
        @materials = Material.all 
        @expenses = @item.expenses
        render layout: false
    end

    def createExpense
        begin
            @expense_paramms = params.require(:expense).permit(:material_id, :quantity, :item_id)
            itemId = @expense_paramms['item_id']
            @expense = Expense.create(@expense_paramms.merge(index: helpers.indexSubCalculator(itemId)))
            if @expense.save
                redirect_to itemExpenses_path(itemId)
            else
                raise "Error al crear gasto: #{@expense.errors.full_messages.to_sentence}."
            end
        rescue Exception => ex
            puts ex 
            redirect_to itemExpenses_path(itemId), error: ex
        end
    end

    def deleteExpense
        begin
            expense = Expense.find(params[:expenseId])
            item = Item.find(expense.item_id)
            projectId =item.project_id
            helpers.indexUpdate(expense)
            expense.destroy
            redirect_to projectShow_path(projectId)
        rescue Exception => ex 
            puts "Error: #{ex}" 
        end
    end

    def deleteExpenseIndex
        begin
            expense = Expense.find(params[:expenseId])
            helpers.indexUpdate(expense)
            expense.destroy
            redirect_to itemExpenses_path(expense.item_id)
        rescue Exception => ex 
            puts "Error: #{ex}" 
        end
    end
end
