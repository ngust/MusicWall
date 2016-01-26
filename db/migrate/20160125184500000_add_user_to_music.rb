class AddUserToMusic < ActiveRecord::Migration
  def change
    add_reference :musics, :user, index: true
    add_foreign_key :musics, :users
  end
end
