class CreateSupplies < ActiveRecord::Migration[5.0]
  def change
    create_table :supplies do |t|
      t.string :title
      t.integer :price
      t.timestamps
    end
  end
end
