class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :number_of_places

      t.timestamps
    end
  end
end
