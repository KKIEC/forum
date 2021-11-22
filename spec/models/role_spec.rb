require 'rails_helper'

RSpec.describe Role, type: :model do

  context "validations tests" do

    it "should return newly created role" do
      role = Role.new(name: "Name example", description: "Desc")
      expect(role.valid?).to eq(true)
    end

    it "test name presence" do
      role = Role.new(description: "Content for description")
      expect(role.valid?).to eq(false)
    end

    it "test description presence" do
      role = Role.new(name: "Name example")
      expect(role.valid?).to eq(false)
    end

  end
end
