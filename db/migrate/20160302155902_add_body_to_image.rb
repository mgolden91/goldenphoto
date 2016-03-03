class AddBodyToImage < ActiveRecord::Migration
  def change
    add_column :images, :body, :text
  end
end
