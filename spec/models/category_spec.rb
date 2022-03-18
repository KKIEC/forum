require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { build(:category, user: user) }

  describe 'validations' do
    it 'returns newly created category' do
      expect(category.valid?).to eq(true)
    end

    it 'checks name presence' do
      category.name = nil
      expect(category.valid?).to eq(false)
    end

    it 'remains valid without user' do
      category.user = nil
      expect(category.valid?).to eq(true)
    end
  end

  describe '#search' do
    let!(:category) { create(:category, user: user) }
    let!(:category2) { create(:category, name: 'AAbbCC', user: user) }

    it 'returns only category2, despite of upper and lower signs in search field' do
      categories = Category.search('aBBc')
      expect(categories.first).to eq(category2)
      expect(categories.count).to eq(1)
    end
  end
end
