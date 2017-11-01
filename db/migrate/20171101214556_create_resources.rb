class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.references :author, null: false

      t.timestamps
    end
  end
end
