class AddTemperatureRangeToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :temperature_range, :string
  end
end
