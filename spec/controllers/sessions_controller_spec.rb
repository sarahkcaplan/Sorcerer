# require 'rails_helper'

# describe SessionsController do
#   let!(:user){User.create(first_name: "John", last_name: "Doe", email: "johnd@gmail.com", user_type: "student", password: "password")}

#   describe "POST create" do
#     it "responds with status code 200" do
#       post :create
#       expect(response). to have_http_status 200
#     end

#     context "when valid login information is passed" do
#       it "assigns the logged in user to @user" do
#         post :create, { email: "johnd@gmail.com", password: "password" }
#         expect(assigns(:user).first_name).to eq(user.first_name)
#       end

#       it "logs in the correct user" do
#         post :create, { email: "johnd@gmail.com", password: "password" }
#         expect(session[:id]).to eq(user.id)
#       end

#       it "redirects to user's available resources page" do
#         post :create, { email: "johnd@gmail.com", password: "password" }
#         expect(response).to redirect_to resources_path
#       end
#     end

#     context "when invalid login information is passed" do
#       before(:each){post :create, {email: "johnd@gmail.com", password: "not_password" }}
#       it "doesn't create a new session" do
#         expect(session[:id]).to be_nil
#       end

#       it "assigns 'Wrong email or password' to errors" do
#         expect(assigns(:errors)[0]).to eq "Wrong email or password"
#       end

#       it "renders sessions/new view" do
#         expect(response).to render_template(:new)
#       end
#     end
#   end

#   describe "GET new" do
#     before(:each){ get :new }
#     it "responds with status 200"  do
#       expect(response).to have_http_status 200
#     end

#     it "renders the log in form view" do
#       expect(response).to render_template(:new)
#     end
#   end

#   describe "DELETE logout" do
#     before(:each){ delete :logout }
#     it "responds with status 200"  do
#       expect(response).to have_http_status 302
#     end

#     it "deletes the current session" do
#       expect(session[:id]).to be_nil
#     end
#   end

# end
