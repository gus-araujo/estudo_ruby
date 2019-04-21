class RemoveReferencesFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :references  
  end
end
