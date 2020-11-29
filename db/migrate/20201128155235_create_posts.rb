class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.date :start_at
      t.date :end_at
      t.string :marriage
      t.integer :child
      t.string :childcare
      t.boolean :care
      t.string :employment_status
      t.string :content
      t.timestamps
    end
  end
end
