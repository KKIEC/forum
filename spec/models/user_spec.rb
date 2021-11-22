require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations tests" do

    it "should return newly created user" do
      user = User.new(name: "Test user", email: "test@example.com", password: "xxxxxxxx")
      expect(user.valid?).to eq(true)
    end

    it "test name presence" do
      user = User.new(email: "test@example.com", password: "xxxxxxxx")
        expect(user.valid?).to eq(false)
    end

    it "test email presence" do
      user = User.new(name: "Test user", password: "xxxxxxxx")
      expect(user.valid?).to eq(false)
    end

    it "test password presence" do
      user = User.new(name: "Test user", email: "test@example.com")
      expect(user.valid?).to eq(false)
    end

  end

  context "tests for method: assign_role" do

    it "method should assign Novice role if any other not assigned before" do
      r1 = Role.create(name: "Novice", description: "Desc")
      user = User.new(name: "Test user", email: "test@example.com", password: "xxxxxxxx")
      user.assign_role
      expect(user.role.id).to eq(r1.id)
    end

    it "should assign Novice role by default before saving" do
      r1 = Role.create(name: "Novice", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx")
    expect(user.role_id).to eq(r1.id)
    end

    it "should keep role if was given in form" do
      r1 = Role.create(name: "Member", description: "Desc")
      r2 = Role.create(name: "Novice", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      expect(user.role_id).to eq(r1.id)
    end

  end

  context "tests for methods: admin? member? novice?" do

    it "should return true if user has Admin role" do
      r1 = Role.create(name: "Admin", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      expect(user.admin?).to eq(true)
    end

    it "should return true if user has Member role" do
      r1 = Role.create(name: "Member", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      expect(user.member?).to eq(true)
    end

    it "should return true if user has Novice role" do
      r1 = Role.create(name: "Novice", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      expect(user.novice?).to eq(true)
    end

  end

end
