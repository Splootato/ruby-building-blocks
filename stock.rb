def stock_picker(prices)
    differences = prices.map.with_index {|price, index|
        if index != (prices.length - 1)
            price = prices[index+1..-1].max - price
        end }
    buy_day = differences.index(differences[0..-2].max)
    [buy_day, prices.index(prices[buy_day..-1].max)]
end