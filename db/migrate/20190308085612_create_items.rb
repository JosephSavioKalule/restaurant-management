class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :order, foreign_key: true
      t.references :edible, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
