require 'rails_helper'

describe ResourcesController do
  let!(:resource) { Resource.create!(user_throw: Resource::THROWS.sample) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(responce).to have_http_status 200
    end

    it "assigns the recent games as @games" do
      get :index
      expect(assigns(:resource).to eq(@resource))
    end

    it "renders the :index template" do
      get :index
      expect(responce).to render_template(:index)
    end
  end

  describe "POST create" do
    it "responces with status code 200" do
      post :create
      expect(responce).to have_http_status 200
    end

    # it "create a new resource in the database" do
    #   expect {post: create, {game: {user_throw}}}
    # end

  end


  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: resource.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct resource as @resource" do
      get :show, { id: resource.id }
      expect(assigns(:resource)).to eq(resource)
    end

    it "renders the :show template" do
      get :show, { id: resource.id }
      expect(response).to render_template(:show)
    end
  end

end