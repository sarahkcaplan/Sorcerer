class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :resource_id, null: false
      t.references :fan, null: false
      t.timestamps
    end
  end
end
