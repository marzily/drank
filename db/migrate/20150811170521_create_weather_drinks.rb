class CreateWeatherDrinks < ActiveRecord::Migration
  def change
    create_table :weather_drinks do |t|
      t.references :weather, index: true, foreign_key: true
      t.references :drink, index: true, foreign_key: true
    end
  end
end
