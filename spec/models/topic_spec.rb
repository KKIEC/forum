require 'rails_helper'

RSpec.describe Topic, type: :model do

  context "validations tests" do

    it "should return newly created post" do
      r1 = Role.create!(name: "Admin", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      topic = Topic.new(name: "Test topic", description: "About test topic", user_id: user.id)
      expect(topic.valid?).to eq(true)
    end

    it "test name presence" do
      r1 = Role.create!(name: "Admin", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      topic = Topic.new(description: "About test topic", user_id: user.id)
      expect(topic.valid?).to eq(false)
    end

    it "test description presence" do
      r1 = Role.create!(name: "Admin", description: "Desc")
      user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
      topic = Topic.new(name: "Test topic", user_id: user.id)
      expect(topic.valid?).to eq(false)
    end

  end

context "test for method: search" do

  it "should return only AAbbCC, despite of upper and lower signs in search field" do
    r1 = Role.create!(name: "Admin", description: "Desc")
    user = User.create!(name: "Test user", email: "test@example.com", password: "xxxxxxxx", role_id: r1.id)
    topicA = Topic.create!(name: "AAbbCC", description: "About test topic", user_id: user.id)
    topicB = Topic.create!(name: "Test topic", description: "About test topic", user_id: user.id)

    topics = Topic.search("aBBc")

    expect(topics.first).to eq(topicA)
    expect(topics.last).to eq(topicA)
    end

  end

end
