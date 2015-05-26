class AddIndexToEstablishments < ActiveRecord::Migration
  def change
    add_index :establishments, :slug
  end
end
