class AddVotes < ActiveRecord::Migration
  def change
    create_join_table :users, :musics, table_name: :votes
  end
end