def bubble_sort(array)
    sorted,sort_iteration = false,1
    until sort_iteration == array.length || sorted do
        sorted,element = true,0
        until element == array.length - sort_iteration do
            if array[element] > array[element+1]
                array[element],array[element+1] = array[element+1],array[element]
                sorted = false
            end
            element += 1
        end
        sort_iteration += 1
    end
    array
end