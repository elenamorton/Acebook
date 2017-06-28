require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'comments have a post ID' do
  post = Post.new
  comment = Comment.create(comment: "Hey", post_id: post.id)
  expect(comment.post_id).to eq(post.id)
end
end
