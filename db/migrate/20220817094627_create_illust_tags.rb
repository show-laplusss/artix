class CreateIllustTags < ActiveRecord::Migration[6.1]
  def change
    create_table :illust_tags do |t|

      t.timestamps
    end
  end
end
