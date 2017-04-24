class CreateForumPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_posts do |t|
      t.references :user, foreign_key: true
      t.references :forum_thread, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
