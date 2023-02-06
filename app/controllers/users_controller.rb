class UsersController < ApplicationController

  get "/user" do 
    users = Restuarant.all
    users.to_json 
  end 
end 