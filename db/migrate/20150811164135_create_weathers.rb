class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :min_temp
      t.integer :max_temp

      t.timestamps null: false
    end
  end
end
