class NotNullAuthor < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :author_id, false
  end
end
