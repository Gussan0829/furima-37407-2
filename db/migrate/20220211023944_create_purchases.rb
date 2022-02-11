class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :post_code    ,null: false
      t.string     :municipality ,null: false
      t.string     :address      ,null: false
      t.string     :building_name
      t.integer    :phone_number ,null: false
      t.references :purchase     ,null: false, foregin_key: true
      t.timestamps
    end
  end
end
