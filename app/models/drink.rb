class Drink < ActiveRecord::Base
  validates :drink_type, presence: true, uniqueness: true

  has_many  :weather_drinks
  has_many  :weathers, through: :drinks
end
