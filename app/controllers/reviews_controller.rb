class ReviewsController < ApplicationController

  get "/reviews" do 
    review = Review.all
    review.to_json(include: :restuarant)
  end 

   get "/reviews/:id" do 
    review = Review.find_by(id: params[:id])
    review.to_json
  end 


    patch "/reviews/:id" do
    review = Review.find(params[:id])
    review.update(
      review: params[:review].capitalize(), rating: params[:rating]
    )
    review.to_json(include: :restuarant)
end


post "/restuarants/:restuarant_id/reviews" do 
  restuarant = Restuarant.find_by(id: params[:restuarant_id])
  review = Review.create(
    review: params[:review].capitalize(), rating: params[:rating],  
    company_name: Restuarant.find_by(id: params[:restuarant_id]).name,
    restuarant_id: Restuarant.find_by(id: params[:restuarant_id]).id
    )
    review.to_json(include: :restuarant)      
end 

  delete "/reviews/:id" do 
    review = Review.find_by(id: params[:id])
    if review 
      review.destroy
      review.to_json
    else 
      {errors: ["Review doesn't exist "]}.to_json
    
  end 
  end

#   patch "/reviews/:id" do
#    review = Review.find_by(id: params[:id])
#     review.update(
#       review: params[:review],
#       rating: params[:rating]
#       )
#     review.to_json
# end


end 