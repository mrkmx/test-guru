class AddTimeToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :test_time, :integer
  end
end
