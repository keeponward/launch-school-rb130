# Divisors

# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.


def divisors(num)
  divs = []
  1.upto(num) do |div|
    divs << div if num % div == 0
  end
  divs
end

# LS Solution
def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end

# Further Exploration

# Based on https://www.geeksforgeeks.org/find-divisors-natural-number-set-1/
def divisors(num)
  divs = []
  square_root = Math.sqrt(num)
  1.upto(square_root) do |div|
    if num % div == 0
      divs << div
      divs << num/div if div != square_root
    end
  end
  divs.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


p divisors(999962000357) == [1, 999979, 999983, 999962000357]

