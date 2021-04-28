class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :gist_url
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.index :gist_url, unique: true

      t.timestamps
    end
  end
end
