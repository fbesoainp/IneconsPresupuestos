module ItemHelper

    def indexMainCalculator(projectId)
        project = Project.find(projectId)
        n = project.items.where('"items"."isMain" = true').count
        return n + 1
    end

    def indexSubCalculator(itemId)
        item = Item.find(itemId)
        n = item.items.count + item.expenses.count
        return n + 1
    end

    def indexUpdate(item)
        if defined?(item.isMain) && item.isMain
            return indexUpdateMain(item)
        else 
            return indexUpdateSub(item)
        end
    end

    def indexUpdateMain(item)
        return "<tr><th><h4><%="#{item.index}."%></h4></th><th style="line-height: 40px;"><h4><strong><%=item.name%></strong></h4></th><th></th><th></th><th></th><th></th></tr>"
        project = Project.find(item.project_id)
        items = project.items.where('"items"."isMain" = true AND "items"."id" != '+"#{item.id}")
        items.sort_by { |item| item.index}
        index = 1
        items.each do |item|
            item.update(index: index)
        index += 1
        end
    end

    def indexUpdateSub(item)
        parentItem = Item.find(item.item_id)
        if item.class.name == "Item"
            items = parentItem.items.where('"items"."id" != '+"#{item.id}") + parentItem.expenses
        else
            items = parentItem.items + parentItem.expenses.where('"expenses"."id" != '+"#{item.id}")
        end
        items = items.sort_by { |item| item.index}
        index = 1
        items.each do |item|
            item.update(index: index)
        index += 1
        end
    end

    def itemTableGenerator(item,index)
        @items = item.items + item.expenses

        @items = @items.sort_by { |item| item.index}

        @index = index
        render(:partial => 'item/showItems')
    end

    def itemIndex(itemId)
        item = Item.find(itemId)
        if item.isMain == true
            return item.index 
        end 

        index = ""
        while true do
            index = "#{item.index}.#{index}"
            if item.isMain == true
                break
            else 
                id = item.item_id
                item = Item.find(id)
            end
        end
        return index[0...-1]
    end

    def itemExpenses(item)
        total = 0
        item.expenses.each do |expense|
            total += expense.quantity * expense.material.price
        end
        item.items.each do |subItem|
            total += itemExpenses(subItem)
        end
        return total
    end

    def reportItems(item,index)
        currentIndex = @index 
        items = item.items + item.expenses
        items = items.sort_by { |item| item.index}
        items.each do |item|
            @index = "#{index}.#{item.index}"
            @items.append([item,@index])
            if item.class.name == "Item"
                puts item.name
                reportItems(item,@index)
                @index = currentIndex
            end 
        end
    end
        
end
