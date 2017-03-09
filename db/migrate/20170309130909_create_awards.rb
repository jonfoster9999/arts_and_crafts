class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.string :title
      t.integer :year
      t.integer :project_id
      t.timestamps
    end
  end
end
