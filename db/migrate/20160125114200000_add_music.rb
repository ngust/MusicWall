class AddMusic < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.string :author
      t.string :url
      t.timestamps null: false
    end
  end
end
