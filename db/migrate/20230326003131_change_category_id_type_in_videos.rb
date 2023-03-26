class ChangeCategoryIdTypeInVideos < ActiveRecord::Migration[7.0]
  def change
    change_column :videos, :category_id, :bigint
  end
end
