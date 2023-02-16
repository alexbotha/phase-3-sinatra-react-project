class ReviewsController < ApplicationController

  get "/reviews" do 
    review = Review.all
    review.to_json(include: :restuarant)
  end 

   get "/reviews/:id" do 
    review = Review.find_by(id: params[:id])
    review.to_json
  end 


#     patch "/reviews/:id" do
#     review = Review.find(params[:id])
#     review.update(
#       review: params[:review], rating: params[:rating], company_name: params[:company_name],
#       restuarant_id: Restuarant.find_by(name: params[:company_name].capitalize()).id
#     )
#     review.to_json(include: :restuarant)
# end

  
  post "/reviews" do 
    review = Review.create(
      review: params[:review].capitalize(), rating: params[:rating], 
      company_name: params[:company_name].capitalize(), 
      restuarant_id: Restuarant.find_by(name: params[:company_name].capitalize()).id
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

  patch "/reviews/:id" do
   review = Review.find_by(id: params[:id])
    review.update(
      review: params[:review],
      rating: params[:rating]
      )
    review.to_json
end


end 