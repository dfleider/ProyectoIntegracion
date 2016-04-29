class CreateFormulasProductos < ActiveRecord::Migration
  def change
    create_table :formulas_productos do |t|
        t.integer :skuProducto
  		t.string :nombreProducto
  		t.integer :lote
  		t.string :unidadProducto
  		t.integer :skuIngrediente
  		t.string :nombreIngrediente
  		t.integer :requerimiento
  		t.string :unidadIngrediente
		t.integer :precioIngrediente
      	t.timestamps null: false
    end
  end
end
