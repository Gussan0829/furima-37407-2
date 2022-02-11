class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :post_code    ,null: false
      t.string     :municipality ,null: false
      t.string     :address      ,null: false
      t.string     :building_name
      t.integer    :prefecture_id,null: false
      t.string     :phone_number ,null: false
      t.references :purchase     ,null: false, foregin_key: true
      t.timestamps
    end
  end
end
