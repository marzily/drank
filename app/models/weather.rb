class Weather < ActiveRecord::Base
  validates :min_temp, presence: true, unless: ->(weather){weather.max_temp.present?}
  validates :max_temp, presence: true, unless: ->(weather){weather.min_temp.present?}
  validate  :temp_range

  has_many  :weather_drinks
  has_many  :drinks, through: :weather_drinks

  def temp_range
    if min_temp && max_temp && (min_temp > max_temp)
      errors.add(:max_temp, "min temp cannot be greater than max temp")
    end
  end

  def self.cold
    @cold ||= Weather.find_by(min_temp: nil)
  end

  def self.mild
    @mild ||= Weather.find_by(min_temp: 66)
  end

  def self.hot
    @hot ||= Weather.find_by(min_temp: 90)
  end

  def self.current_range(current_temp)
    return cold if current_temp.to_i <= cold.max_temp
    return hot if current_temp.to_i >= hot.min_temp
    mild
  end
end
