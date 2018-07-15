class RemoveChefFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :chef, :string
  end
end
