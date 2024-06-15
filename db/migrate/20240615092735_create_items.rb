class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :img_url
      t.string :name
      t.json :unit_price, default: '[]'
      t.json :tenth_price, default: '[]'
      t.json :hundred_price, default: '[]'
      t.json :scrap_date, default: '[]'
      t.float :f_xp
      t.integer :xp_quantity
      t.string :ressource_type
      t.boolean :must_buy

      t.timestamps
    end
  end
end
