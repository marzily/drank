class DropSearchApis < ActiveRecord::Migration
  def change
    drop_table :search_apis
  end
end
