puts "Secret Phrase Generator"
puts
print "Please enter the phrase youd like to scramble: "
string = gets.chomp

print "Now give me a number to scramble your phrase with: "
shift = gets.chomp
shift = shift.to_i
puts

def caesar_cipher(string, shift)
    split_array = string.bytes

    shifted_array = split_array.map do |value|
        if (value + shift).between?(91, 96)
            (value + shift - 90) + 65
        elsif (value + shift) > 122
            (value + shift - 122) + 97
        elsif value == 32
            value
        elsif value.between?(0, 31) || value.between?(33, 64) || value.between?(91, 96) || value > 122
            value
        else
            value + shift
        end
    end

    puts "Here is your scrambled phrase, use it wisely:"
    print shifted_array.pack('c*')
    puts
end

caesar_cipher(string, shift)
puts