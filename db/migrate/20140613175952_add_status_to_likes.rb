class AddStatusToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :status, :integer, default: 0
  end
end
