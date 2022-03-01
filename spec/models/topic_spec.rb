require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:user) { create(:user) }
  let(:topic) { build(:topic, user: user) }

  describe 'validations' do
    it 'returns newly created topic' do
      expect(topic.valid?).to eq(true)
    end

    it 'checks name presence' do
      topic.name = nil
      expect(topic.valid?).to eq(false)
    end

    it 'checks description presence' do
      topic.description = nil
      expect(topic.valid?).to eq(false)
    end

    it 'remains valid without user' do
      topic.user = nil
      expect(topic.valid?).to eq(true)
    end
  end

  describe '#search' do
    let!(:topic) { create(:topic, user: user) }
    let!(:topic2) { create(:topic, name: 'AAbbCC', user: user) }

    it 'returns only topic2, despite of upper and lower signs in search field' do
      topics = Topic.search('aBBc')
      expect(topics.first).to eq(topic2)
      expect(topics.count).to eq(1)
    end
  end
end
