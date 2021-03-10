class AddCalendarIdToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :calendar_id, :string
  end
end
