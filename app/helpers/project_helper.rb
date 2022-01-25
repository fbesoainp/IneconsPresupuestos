module ProjectHelper
    
    def projectExpenses(project)
        total = 0
        project.items.where('"items"."isMain" = true').each do |item|
            total += itemExpenses(item)
        end
        return total
    end

    def projectItems(project)
        @items = []
        begin
            projectItems = project.items.where('"items"."isMain" = true').sort_by { |item| item.index}
            projectItems.each do |item|
                @index = item.index
                @items.append([item,@index])
                reportItems(item,@index)            
            end
            puts "LISTO"
            return @items
        rescue Exception => ex
            puts ex
            return error
        end
        
    end

    def projectMaterials(project)
        project.items.where('"items"."isMain" = true').each do |item|
            itemMaterials(item)
        end
        materials = []
        while true do 
            if @expenses.length == 0 
                break 
            end
            materialId = @expenses[0].material.id
            materials.append(@expenses.select {|expense| expense.material.id == materialId})
            @expenses.reject! {|expense| expense.material.id == materialId}
        end
        materials.each do |expenses|
            element = [expenses[0].material]
            quantity = 0
            expenses.each do |expense|
                puts "ExpenseId #{expense.id} Quantity #{expense.quantity} Material #{expense.material.name} "

                quantity += expense.quantity
            end
            element.append(quantity)
            @materials.append(element)
        end
    end
   
end
