class ChangeEmailUniqueToUsers < ActiveRecord::Migration[6.0]
  def change
    # Это вообще никак не повлияет на БД и schema, ошибочный "лучший ответ" на SO. Или может в старых версиях так работало
    # https://stackoverflow.com/questions/33831788/change-column-in-rails-to-be-unique
    # правильное решение - добавить индекс, см. следующую миграцию
    change_column :users, :email, :string, unique: true
  end
end
