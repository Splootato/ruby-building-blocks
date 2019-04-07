def substrings(string, array)
    string.downcase!
    results = {}
    array.each { |word|
        if string.include?(word)
            results[word] = string.scan(word).count
        end }
    results
end