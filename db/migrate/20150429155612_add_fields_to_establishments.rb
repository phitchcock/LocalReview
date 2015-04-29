class AddFieldsToEstablishments < ActiveRecord::Migration
  def change
    add_column :establishments, :city, :string
    add_column :establishments, :map, :string
  end
end
