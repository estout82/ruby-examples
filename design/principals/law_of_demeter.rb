#!/usr/bin/env ruby

# an object should only invoke methods on the following objects
# - itself
# - its parameters
# - any objects it creates / instantiates
# - its direct components

# violations ---

# multiple dots
# - to fix, use rails delegates on the model
class User
    def discounted_plan_price(discount_code)
        coupon = Coupon.new(discount_code)
        coupon.discount(account.plan.price) # references account.plan.price - didn't instantiate plan
    end
end