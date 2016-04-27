class CreateProductosMercados < ActiveRecord::Migration
  def change
    create_table :productos_mercados do |t|
    	t.integer :sku
  		t.string :nombre
  		t.string :tipo
  		t.integer :grupo
  		t.string :unidades
  		t.integer :costoProduccion
  		t.integer :loteProduccion
  		t.float :tiempoProduccion
      	t.timestamps null: false
    end
  end
end
