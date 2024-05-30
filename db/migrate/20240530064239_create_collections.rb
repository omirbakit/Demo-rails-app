class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :category

      t.timestamps
    end
    add_index :collections, [:user_id, :created_at]
  end
end
