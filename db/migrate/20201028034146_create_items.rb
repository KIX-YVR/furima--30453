class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :who_pays_delivery_fee_id, null: false
      t.integer :from_where_to_send_id, null: false
      t.integer :how_long_does_it_take_to_send_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
