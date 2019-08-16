class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.string :home_type
      t.string :room_type
      t.string :accommodate
      t.string :bedrooms
      t.string :bathrooms
      t.integer  :price
      t.string :listing_name
      t.string :summary
      t.boolean :is_tv, default: false
      t.boolean :is_kitchen, default: false
      t.boolean :is_internet, default: false
      t.boolean :is_heating, default: false
      t.boolean :is_air, default: false
      t.string :address
      t.boolean :is_active, default:false

      t.timestamps
    end
  end
end
