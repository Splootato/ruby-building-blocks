def stock_picker(prices)
    differences = prices.map.with_index {|price, index|
    if index != (prices.length - 1)
        price = prices[index+1..-1].max - price
    end }
    differences.pop
    [differences.index(differences.max), prices.index(prices[differences.index(differences.max)..-1].max)]
end