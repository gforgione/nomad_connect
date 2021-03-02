class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.boolean :visible, null: false, default: true
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
