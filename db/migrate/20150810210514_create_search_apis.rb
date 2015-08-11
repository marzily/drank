class CreateSearchApis < ActiveRecord::Migration
  def change
    create_table :search_apis do |t|

      t.timestamps null: false
    end
  end
end
