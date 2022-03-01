require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }

    it 'returns newly created user' do
      expect(user.valid?).to eq(true)
    end

    it 'checks name presence' do
      user.name = nil
      expect(user.valid?).to eq(false)
    end

    it 'checks name uniqueness' do
      user2 = User.new
      user2.name = user.name
      expect(user2.valid?).to eq(false)
    end

    it 'checks email presence' do
      user.email = nil
      expect(user.valid?).to eq(false)
    end

    it 'checks password presence' do
      user.password = nil
      expect(user.valid?).to eq(false)
    end

    describe 'at_least_one_admin' do
      let(:user) { create(:user, role: 'admin') }

      it 'protect from lost the last admin' do
        user.role = 'member'
        expect(user.valid?).to eq(false)
      end
    end
  end

  describe 'enum role' do
    let(:user) { create(:user) }

    it 'assigns novice role by default' do
      expect(user.role).to eq('novice')
    end
  end

  describe '#search' do
    let!(:user) { create(:user, email: 'a@example.com') }
    let!(:user2) { create(:user, name: 'AAbbCC', email: 'b@example.com') }

    it 'returns only user2, despite of upper and lower signs in search field' do
      users = User.search('aBBc')
      expect(users.first).to eq(user2)
      expect(users.count).to eq(1)
    end
  end
end
