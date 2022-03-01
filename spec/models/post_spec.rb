require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:topic) { create(:topic, user: user) }
  let(:post) { build(:post, user: user, topic: topic) }

  context 'validations' do
    it 'returns newly created post' do
      expect(post.valid?).to eq(true)
    end

    it 'checks name presence' do
      post.name = nil
      expect(post.valid?).to eq(false)
    end

    it 'checks body presence' do
      post.body = nil
      expect(post.valid?).to eq(false)
    end

    it 'remains valid without user' do
      post.user = nil
      expect(post.valid?).to eq(true)
    end
  end

  describe '#search' do
    let!(:post) { create(:post, user: user, topic: topic) }
    let!(:post2) { create(:post, name: 'AAbbCC', user: user, topic: topic) }

    it 'returns only topic2, despite of upper and lower signs in search field' do
      posts = Post.search('aBBc')
      expect(posts.first).to eq(post2)
      expect(posts.count).to eq(1)
    end
  end
end
