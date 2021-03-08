class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :summary
      t.string :location
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
