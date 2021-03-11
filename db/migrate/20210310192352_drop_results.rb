class DropResults < ActiveRecord::Migration[6.0]
  def change
    drop_table :results, if_exists: true
  end
end
