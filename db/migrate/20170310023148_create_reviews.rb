class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :content
      t.integer :project_id
      t.timestamps
    end
  end
end
