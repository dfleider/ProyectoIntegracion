class CreatePreciosProductos < ActiveRecord::Migration
  def change
    create_table :precios_productos do |t|
    	t.integer :sku
  		t.string :nombre
  		t.integer :precio
      t.timestamps null: false
    end
  end
end
