json.extract! forum_post, :id, :user_id, :forum_thread_id, :content, :created_at, :updated_at
json.url forum_post_url(forum_post, format: :json)
