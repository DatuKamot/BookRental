class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :category
      t.decimal :price
      t.text :description
      t.string :status

      t.timestamps null: false
    end
  end
end
