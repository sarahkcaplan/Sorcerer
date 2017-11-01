class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.boolean :permission
      t.timestamps
    end
  end
end
