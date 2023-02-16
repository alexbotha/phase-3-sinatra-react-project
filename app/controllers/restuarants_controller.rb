class RestuarantsController < ApplicationController

  get "/restuarants" do 
    restuarants = Restuarant.all
    restuarants.to_json(include: :reviews)
  end  
  
  get "/restuarants/:id" do 
    restuarant = Restuarant.find_by(id: params[:id])
    if restuarant
    restuarant.to_json(include: :reviews)
    else 
      "Restuarant not found"
    end
end

post "/restuarants" do 
 restuarant = Restuarant.create(
  cuisine: params[:cuisine].capitalize(), 
  overall_rating: params[:overall_rating], 
  website: params[:website], name: params[:name].capitalize())
 
  if restuarant.save 
    restuarant.to_json(include: :reviews)
  else
    {errors: restuarant.errors.full_messages}.to_json
  end
end 

delete "/restuarants/:id" do 
  restuarant = Restuarant.find_by(id: params[:id])
  if restuarant 
    restuarant.destroy
    restuarant.to_json
  else 
    {errors: ["Restuarant doesn't exist "]}.to_json 
end 
end

end 