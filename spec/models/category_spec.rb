require 'rails_helper'

RSpec.describe Category, type: :model do

  context "validations tests" do

    it "should return newly created category" do
      r1 = Role.create!(name: "Admin", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      category = Category.new(name: "Test category", user_id: user.id)
      expect(category.valid?).to eq(true)
    end

    it "test name presence" do
      r1 = Role.create!(name: "Admin", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      category = Category.new(user_id: user.id)
        expect(category.valid?).to eq(false)
    end

  end

end
