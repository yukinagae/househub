class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.float :price
      t.float :population

      t.timestamps null: false
    end
  end
end
