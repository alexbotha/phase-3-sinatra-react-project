require 'pry'
class RestuarantsController < ApplicationController

  get "/restuarants" do 
    restuarants = Restuarant.all
    restuarants.to_json(include: :reviews)
  end  
  
  get "/restuarants/:id" do 
    restuarant = Restuarant.find_by(id: params[:id])
    restuarant.to_json(include: :reviews)    
end

post "/restuarants" do 
 restuarant = Restuarant.create(
  cuisine: params[:cuisine].titleize(), 
  overall_rating: params[:overall_rating], 
  website: params[:website], name: params[:name].titleize())
    restuarant.to_json(include: :reviews)
end 

delete "/restuarants/:id" do 
  restuarant = Restuarant.find_by(id: params[:id])
    restuarant.destroy
    restuarant.to_json
end

end 