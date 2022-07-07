#!/usr/bin/env ruby

# below is the value of a stock at the end of every day
prices = [7,1,5,3,6,4]

# find the optimal day to by and sell the stock for profit
# - we will be finding the lowest trough on the graph followed by the
#   highest peak

def max_profit(prices)
  min_price = 0
  max_profit = 0

  prices.each_with_index do |price, i|
    if i == 0
      min_price = price
      next
    end

    if price < min_price
      min_price = price
    elsif price - min_price > max_profit

      max_profit = price - min_price
    end
  end

  max_profit
end

puts max_profit(prices)