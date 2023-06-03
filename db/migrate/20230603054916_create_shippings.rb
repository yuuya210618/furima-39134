class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :post_code          , null: false 
      t.integer    :shipping_origin_id , null: false
      t.string     :mayor_ward_village , null: false
      t.string     :address            , null: false
      t.string     :building     
      t.string     :telephone_number   , null: false
      t.references :purchase           , null: false, foreign_key: true
      t.timestamps
    end
  end
end
