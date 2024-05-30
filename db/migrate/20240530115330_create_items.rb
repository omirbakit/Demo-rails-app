class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :collection, null: false, foreign_key: true
      t.string :name
      t.string :tag

      t.timestamps
    end
  end
end
