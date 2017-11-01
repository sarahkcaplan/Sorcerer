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
end
