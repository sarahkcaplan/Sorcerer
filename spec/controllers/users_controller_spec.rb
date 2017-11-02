require 'rails_helper'

describe UsersController do
   let(:user) {User.create(first_name: "Sarah", last_name: "Caplan", email: "sarah@gmail.com", password: "1234", user_type: "Student")}

   describe "GET#index" do

   end


end
