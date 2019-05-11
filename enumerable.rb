module Enumerable
    def my_each
        for i in 0..self.length-1
            yield(self[i])
        end
        self
    end
    def my_each_with_index
        for i in 0..self.length-1
            yield(self[i],i)
        end
        self
    end
    def my_select
        result = []
        self.my_each { |item| result << item if yield(item) }
        result
    end
    def my_all?
        self.my_each { |item| return false if !yield(item)}
        true
    end
    def my_any?
        self.my_each { |item| return true if yield(item)}
        false
    end
    def my_none?
        self.my_each { |item| return false if yield(item)}
        true
    end
    def my_count(value = nil)
        count = 0
        if value
            self.my_each { |item| count += 1 if item == value }
        elsif block_given?
            self.my_each { |item| count += 1 if yield(item) }
        else
            count = self.length
        end
        count
    end
    def my_map(proc = nil)
        result = []
        if proc
            self.my_each_with_index { |item, index| result[index] = proc.call(item)}
        else
            self.my_each_with_index { |item, index| result[index] = yield(item) }
        end
        result
    end
    def my_inject(result = 0)
        self.my_each { |item| result = yield(result,item) }
        result
    end
end
def multiply_els(array)
    array.my_inject(1) { |product, x| product * x }
end