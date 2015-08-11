class Drink < ActiveRecord::Base
  validates :drink_type, presence: true, uniqueness: true
  has_many  :weathers
end
