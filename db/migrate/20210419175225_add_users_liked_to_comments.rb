class AddUsersLikedToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :users_liked, :uuid, unique: true, array: true, default: []
  end
end
