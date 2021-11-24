require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations tests' do
    it 'should return newly created post' do
      r1 = Role.create!(name: 'Admin', description: 'Desc')
      user = User.create!(name: 'Test user', email: 'test@example.com', password: 'xxxxxxxx', role_id: r1.id)
      topic = Topic.create!(name: 'Test topic', description: 'About test topic', user_id: user.id)
      post = Post.new(name: 'Test post', body: 'Content for test post', user_id: user.id, topic_id: topic.id)
      expect(post.valid?).to eq(true)
    end

    it 'test name presence' do
      r1 = Role.create!(name: 'Admin', description: 'Desc')
      user = User.create!(name: 'Test user', email: 'test@example.com', password: 'xxxxxxxx', role_id: r1.id)
      topic = Topic.create!(name: 'Test topic', description: 'About test topic', user_id: user.id)
      post = Post.new(body: 'Content for test post', user_id: user.id, topic_id: topic.id)
      expect(post.valid?).to eq(false)
    end

    it 'test body presence' do
      r1 = Role.create!(name: 'Admin', description: 'Desc')
      user = User.create!(name: 'Test user', email: 'test@example.com', password: 'xxxxxxxx', role_id: r1.id)
      topic = Topic.create!(name: 'Test topic', description: 'About test topic', user_id: user.id)
      post = Post.new(name: 'Test post', user_id: user.id, topic_id: topic.id)
      expect(post.valid?).to eq(false)
    end
  end
end
