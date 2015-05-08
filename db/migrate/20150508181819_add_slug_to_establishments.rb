class AddSlugToEstablishments < ActiveRecord::Migration
  def change
    add_column :establishments, :slug, :string, :uniquie => true
  end
end
