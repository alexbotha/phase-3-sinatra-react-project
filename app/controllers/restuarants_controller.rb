require 'pry'
class RestuarantsController < ApplicationController

  get "/restaurants" do 
    restaurant = Restuarant.all
    restaurant.to_json(include: :reviews)
  end  
  
  get "/restaurants/:id" do 
    restaurans = Restuarant.find_by(id: params[:id])
    restaurant.to_json(include: :reviews)    
end

post "/restaurants" do 
  restaurant = Restuarant.create(
  cuisine: params[:cuisine].titleize(), 
  overall_rating: params[:overall_rating], 
  website: params[:website], name: params[:name].titleize())
  restaurant.to_json(include: :reviews)
end 

delete "/restaurants/:id" do 
  restaurant = Restuarant.find_by(id: params[:id])
  restaurant.destroy
  restaurant.to_json
end

end 