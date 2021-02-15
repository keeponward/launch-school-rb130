class PerfectNumber

    def self.classify(num)

      raise StandardError if num <= 0

      divisors = []

      divisors = self.get_divisors(num)

      # p divisors

      sum = divisors.sum
      return 'perfect' if sum == num
      return 'deficient' if sum < num
      return 'abundant' if sum >num
    end

    def self.get_divisors(num)
      div_arr = []
      (num/2).times do |iter|
        poss_div = iter + 1
        div_arr << poss_div if num % poss_div == 0
      end
      div_arr
    end
end

# Launch School Solution

# class PerfectNumber
#   def self.classify(number)
#     raise StandardError.new if number < 1
#     sum = sum_of_factors(number)

#     if sum == number
#       'perfect'
#     elsif sum > number
#       'abundant'
#     else
#       'deficient'
#     end
#   end

#   class << self
#     private

#     def sum_of_factors(number)
#       (1...number).select do |possible_divisor|
#         number % possible_divisor == 0
#       end.sum
#     end
#   end
# end


puts PerfectNumber.classify(28)
