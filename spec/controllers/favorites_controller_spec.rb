require 'rails_helper'

describe FavoritesController do
  let!(:fan) {User.create(first_name: "Iris", last_name: "Cosmos", email: "iris@cosmos.com", password: "password", user_type: "teacher")}
  let!(:resource) {Resource.create(title: Faker::Book.title, url: Faker::Internet.url, author_id: fan.id)}

  before do
    session[:id] = fan.id
  end

  describe "POST #create" do
    context "when a student or teacher favorites a resource for the first time" do

      it "responds with status code 204" do
        post :create, params: {resource_id: resource.id, fan_id: fan.id}
        expect(response).to have_http_status 204
      end

      it "assigns the created favorite as @favorite" do
        post :create, params: {resource_id: resource.id, fan_id: fan.id}
        expect(assigns(:favorite).class).to eq Favorite
      end

      it "creates a new favorite in the database" do
        expect { post :create, params: {resource_id: resource.id, fan_id: fan.id, id: resource.id} }.to change(Favorite, :count).by(1)
      end
    end
  end
end
