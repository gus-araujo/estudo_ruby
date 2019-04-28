class RemoveUserIdIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_index "posts", name: "index_posts_on_user_id_id"
  end
end
