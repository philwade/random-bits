#this is a ruby version of the knights keypad problem, solved using the dynamic programming solution seen
# on stackoverflow here: http://stackoverflow.com/questions/2893470/generate-10-digit-number-using-a-phone-keypad
# thanks for reading!

paths = [
        [4, 6], #0
        [6,8], #1
        [7,9], #2
        [4,8], #3
        [0, 3, 9], #4
        [], #5
        [7, 1, 0], #6
        [6,2], #7
        [3,1], #8
        [4,2] #9
        ]

n = ARGV[0].to_i

counts = Array.new(n + 1) { Array.new(10) { |i| i } }

(0..9).each do |i|
    counts[1][i] = 1
end

(2..n).each do |number|
    (0..9).each do |digit|
        sum = 0
        paths[digit].each do |from|
            sum += counts[number - 1][from]
        end
        counts[number][digit] = sum
    end
end

puts counts[n][1]
