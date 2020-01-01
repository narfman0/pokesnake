class AddHeightWeightToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :height, :integer
    add_column :pokemons, :weight, :integer
  end
end
