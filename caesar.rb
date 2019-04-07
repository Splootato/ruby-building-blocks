def caesar_cipher(string, shift)
    alphabet_uppercase = ("A".."Z").to_a
    alphabet_lowercase = ("a".."z").to_a
    numbers = []
    shifted_numbers = []
    is_uppercase = []
    result = []
    
    letters = string.split("")
    letters.each { |letter|
        if alphabet_uppercase.include?(letter)
            numbers.push(alphabet_uppercase.index(letter))
            is_uppercase.push(true)
        elsif alphabet_lowercase.include?(letter)
            numbers.push(alphabet_lowercase.index(letter))
            is_uppercase.push(false)
        else
            numbers.push(letter)
            is_uppercase.push("")
        end }

    shifted_numbers = numbers.map { |number|
        if !number.is_a? Integer
            number = number
        elsif number + shift > 25
            number = number - (26 - shift)
        else
            number = number + shift
        end }

    shifted_numbers.each.with_index { |number, index|
        if is_uppercase[index] == ""
            result.push(number)
        elsif is_uppercase[index]
            result.push(alphabet_uppercase[number])
        else
            result.push(alphabet_lowercase[number])
        end }
    result.join
end