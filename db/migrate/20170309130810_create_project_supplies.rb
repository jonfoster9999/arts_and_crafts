class CreateProjectSupplies < ActiveRecord::Migration[5.0]
  def change
    create_table :project_supplies do |t|
      t.integer :project_id
      t.integer :supply_id
      t.integer :quantity
      t.timestamps
    end
  end
end
