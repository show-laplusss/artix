class CreateIllusts < ActiveRecord::Migration[6.1]
  def change
    create_table :illusts do |t|
      t.integer :user_id
      t.string :image_tag
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
