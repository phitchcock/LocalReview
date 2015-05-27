class RemoveIndexFromEstablishements < ActiveRecord::Migration
  def change
    remove_index :establishments, :slug
  end
end
