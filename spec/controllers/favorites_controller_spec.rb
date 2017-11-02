require 'rails_helper'

describe FavoritesController do
  let!(:fan) {User.create(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", user_type: "teacher")}
  let!(:resource) {Resource.create(title: Faker::Book.title, url: Faker::Internet.url)}
  let!(:favorite) {Favorite.create(resource_id: resource.id, fan_id: fan.id)}

  describe "POST #create" do
    context "when a student or teacher favorites a resource for the first time" do
      it "responds with status code 302" do
        post :create, resource_id: 1
        expect(response).to have_http_status 302
      end
      it "assigns the created favorite as @favorite" do
      end
      it "creates a new favorite in the database" do
      end
    end

    context "when a student or teacher tries to re-favorite a resource" do
      it "does not create a new favorite in the database" do
      end
    end
  end

  describe "POST #destroy" do
    context "when a student or a teacher un-favorites a resource" do
      it "removes a favorite from the database" do
      end
    end
  end
end
