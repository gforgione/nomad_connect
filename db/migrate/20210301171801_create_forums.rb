class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :name, null: false
      t.string :group, null: false
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
