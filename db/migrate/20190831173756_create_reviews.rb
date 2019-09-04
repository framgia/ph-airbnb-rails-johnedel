class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :comment
      t.references :reservation, foreign_key: true
      t.references :room, foreign_key: true
      t.boolean :review_type
      t.integer :guest_id
      t.integer :host_id
      t.timestamps
    end
  end
end