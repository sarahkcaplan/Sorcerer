require 'rails_helper'

describe UsersController do
   let(:user) {User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", password: "1234", user_type: "Student")}

   describe "GET#index" do
    before(:each) { get :index }

    it "responds with status code 200" do
      expect(response).to have_http_status 200
    end

    it "assigns the users created to @users" do
      User.create(first_name: "Iris", last_name: "Nevins", email: "iris@gmail.com", password: "1234", user_type: "Student")
      User.create(first_name: "Joe", last_name: "Lesca", email: "joe@gmail.com", password: "1234", user_type: "Student")
      users = User.all
      expect(assigns(:users)).to eq(users)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end
   end

  describe "GET#show" do
    it "responds with status code 200" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct user as @user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it "renders the show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before(:each) { get :new}

    it "responds with status code 200" do
      expect(response).to have_http_status 200
    end

    it "assigns a new user to @user" do
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, user: {first_name: "Maria", last_name: "Maria", email: "maria@gmail.com", password: "1234", user_type: "Student"}
        expect(response).to have_http_status 302
      end

      it "creates a new user in the database" do
        expect{ post :create, user: {first_name: "Maria", last_name: "Maria", email: "maria@gmail.com", password: "1234", user_type: "Student"}}.to change{User.count}.by(1)
      end

      it "assigns the newly created user as @user" do
        post :create, user: {first_name: "Maria", last_name: "Maria", email: "maria@gmail.com", password: "1234", user_type: "Student"}
        expect(assigns(:user)).to eq User.last
      end

      it "sets a notice that the user was successfully created" do
        post :create, user: {first_name: "Maria", last_name: "Maria", email: "maria@gmail.com", password: "1234", user_type: "Student"}
        expect(flash[:notice]).to eq "User was successfully created."
      end

      it "redirects to the created user" do
        post :create, user: {first_name: "Maria", last_name: "Maria", email: "maria@gmail.com", password: "1234", user_type: "Student"}
        expect(response).to redirect_to User.last
      end

    end
  end
end
