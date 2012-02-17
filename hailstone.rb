#solution to hailstone sequence seen here: http://programmingpraxis.com/2012/02/17/hailstones/
n = ARGV[0].to_i

while n != 1
    puts n
    if n % 2 == 0
        n = n / 2
    else
        n = 3 * n + 1
    end
end

puts n
puts "4, 3, 1 will now repeat endlessly."
