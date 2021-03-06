class CreateEmoticons < ActiveRecord::Migration
  def change
    create_table :emoticons do |t|
      t.integer :user_id, null: false
      t.integer :message_id, null: false
      t.string  :icon, null: false

      t.timestamps null: false
    end
  end
end
