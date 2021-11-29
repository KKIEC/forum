require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  describe 'validations' do
    it 'returns newly created category' do
      expect(category.valid?).to eq(true)
    end

    it 'checks name presence' do
      category.name = nil
      expect(category.valid?).to eq(false)
    end
  end
end
