require 'rails_helper'

describe User do
  describe "creating a new user" do
    let(:user) {User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", password: "1234", user_type: "Student")}

    it "creates a user with a first name" do
      expect(user.first_name).to eq "Sarah"
    end

    it "creates a user with a last name" do
      expect(user.last_name).to eq "Caplan"
    end

    it "creates a user with an email" do
      expect(user.email).to eq "sarah@gmail.com"
    end

    it "creates a user with a password" do
      expect(user.password).to eq "1234"
    end

    it "creates a user with a user type" do
      expect(user.user_type).to eq "Student"
    end

    it "adds the new user to the database" do
      expect(user).to eq(User.last)
    end
  end

  describe "failing to create a new user" do
    it "fails to add a new user to the database when the first name is missing" do
      User.create( last_name: "Caplan", email: "sarah@gmail.com", password: "1234", user_type: "Student")
      expect(User.all).to be_empty
    end

    it "fails to add a new user to the database when the last name is missing" do
      User.create(first_name: "Sarah", email: "sarah@gmail.com", password: "1234", user_type: "Student")
      expect(User.all).to be_empty
    end

    it "fails to add a new user to the database when the email is missing" do
      User.create(first_name: "Sarah", last_name: "Caplan", password: "1234", user_type: "Student")
      expect(User.all).to be_empty
    end

    it "fails to add a new user to the database when the password is missing" do
      User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", user_type: "Student")
      expect(User.all).to be_empty
    end

   it "fails to add a new user to the database when the user type is missing" do
      User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", password: "1234")
      expect(User.all).to be_empty
    end
  end

  describe "association between users and resources that they create" do
    let(:user) {User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", password: "1234", user_type: "Student")}

    let!(:resource) {user.resources_posted.create(title: "Google", url: "google.com")}

    it "allows a user to create a resource" do
      expect(user.resources_posted.first).to eq(resource)
    end

    it "allows a user to create a resource with the author_id matching the user's id" do
      expect(resource.author_id).to eq(user.id)
    end

    it "allows a user to create a resource with the author_id matching the user's id" do
      expect(resource.author_id).to eq(user.id)
    end
  end

  describe "association between users and resources that they favorite" do
    let(:user) {User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", password: "1234", user_type: "Student")}

    let!(:resource1) {Resource.create(title: "Google", url: "google.com", author_id: 1)}

    let!(:resource2) {Resource.create(title: "Amazon", url: "amazon.com", author_id: 1)}

    let!(:favorite1) {user.favorites.create(fan_id: user.id, resource_id: resource1.id) }

    let!(:favorite2) {user.favorites.create(fan_id: user.id, resource_id: resource2.id) }

    it "allows a user to favorite a resource" do
      expect(user.favorites.first).to eq(favorite1)
    end

    it "allows a user to have a list of favorites" do
      expect(user.favorites).to include(favorite1, favorite2)
    end

    it "allows a user to have a list of favorited resources " do
      expect(user.resources_favorited).to include(resource1, resource2)
    end
  end
end




