class AddIllustIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :illust_id, :integer
  end
end
