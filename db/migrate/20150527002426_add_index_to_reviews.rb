class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, :establishment_id
  end
end
