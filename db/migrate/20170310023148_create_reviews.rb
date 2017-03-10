class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.integer :project_id
      t.integer :author_id
      t.timestamps
    end
  end
end
