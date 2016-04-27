class ProductosMercado < ActiveRecord::Migration
  def up
  	create_table :productosMercados do |t|
  		t.integer :sku
  		t.string :nombre
  		t.string :tipo
  		t.integer :grupo
  		t.string :unidades
  		t.integer :costoProduccion
  		t.integer :loteProduccion
  		t.float :tiempoProduccion
  		t.timestamps
  	end
  end
  def down
  	drop_table :productosMercado
  end
end
