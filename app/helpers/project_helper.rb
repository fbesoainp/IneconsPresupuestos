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
   
end
