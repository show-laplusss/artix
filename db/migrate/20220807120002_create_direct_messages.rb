class CreateDirectMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :direct_messages do |t|
      t.integer :user_id
      t.integer :room_id
      t.text :message

      t.timestamps
    end
  end
end
