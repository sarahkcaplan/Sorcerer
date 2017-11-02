class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.boolean :permission, null: false
=begin
  The permission boolean represents the student's permission.
  A value of 'false' indicates a student is unable to see the tag,
  as well as the resource(s) using the tag.
=end
      t.timestamps
    end
  end
end
