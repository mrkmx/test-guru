class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    # теперь без валидации на уровне модели (раньше можно было "обойти"):
    # ActiveRecord::RecordNotUnique (SQLite3::ConstraintException: UNIQUE constraint failed: users.email)
    # с валидацией в модели:
    # ActiveRecord::RecordInvalid (Validation failed: Email has already been taken)
    # Сначала надо почистить дубли в БД
    add_index :users, :email, unique: true
  end
end
