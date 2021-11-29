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
  end
end
