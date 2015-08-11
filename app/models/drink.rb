class Drink < ActiveRecord::Base
  validates :drink_type, presence: true, uniqueness: true
end

# below 60 degrees
  # hot chocolate
  # coffee
  # tea
  # latte
  # mocha
  # espresso and espresso drinks
  # hot apple cider
  # steamed milk

# 70 - 80 degrees
  # iced tea
  # juice
  # iced coffee
  # iced espresso drinks
  # soft drinks
  # lemonade
  # italian soda
  # shakes
  # soylent

# 90 degrees +
  # all drinks for 70 - 80 degree temps
  # smoothies
  # ice blended drinks
  # slushies
