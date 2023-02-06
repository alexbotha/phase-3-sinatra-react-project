class RestuarantsController < ApplicationController

  get "/restuarants" do 
    @restuarant = Restuarant.all
    restuarant_to_json
  end  
  
  get "/restuarants/:id" do 
    find_restuarant
    restuarant_to_json
end

  post "/restuarants" do 
    @restuarant = Restuarant.new(params)
    if @restuarant.save 
      @restuarant_to_json
 else
  restuarant_error_message
 end
end 

delete "/restuarants/:id" do 
  find_restuarant
  if @restuarant 
    @restuarant.destroy
    @restuarant.to_json
  else 
    {errors: ["Restuarant doesn't exist "]}.to_json
  
end 
end

  patch "/restuarants/:id" do
    find_restuarant
    if @restuarant.update(params)
      restuarant_to_json
    else 
    restuarant_error_message  
end 
end



private 
  def find_restuarant
    @restuarant = Restuarant.find_by_id(params["id"])
  end 

  def restuarant_to_json 
    @restuarant.to_json(include: [:reviews])
  end 

  def restuarant_error_message 
    {errors: @restuarant.errors.full_messages}.to_json
  end 
 

end 