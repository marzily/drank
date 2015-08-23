class Drink < ActiveRecord::Base
  validates :drink_type, presence: true, uniqueness: true

  has_many  :weather_drinks
  has_many  :weathers, through: :drinks

  # cold = Weather.create(min_temp: nil, max_temp: 69)
  # mild = Weather.create(min_temp: 70, max_temp: 89)
  # hot = Weather.create(min_temp: 90, max_temp: nil)

  def self.hot
    
  end

end
