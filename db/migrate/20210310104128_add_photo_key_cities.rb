class AddPhotoKeyCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :photo_key, :string
  end
end
