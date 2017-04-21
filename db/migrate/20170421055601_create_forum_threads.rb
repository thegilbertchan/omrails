class CreateForumThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_threads do |t|
      t.references :user, foreign_key: true
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
