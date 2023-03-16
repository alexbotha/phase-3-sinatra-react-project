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
    review = Review.find_by(id: params[:id])
    review.update(
      review: params[:review].capitalize(), rating: params[:rating]
    )
    review.to_json(include: :restuarant)
end


post "/restaurants/:restaurant_id/reviews" do 
  restaurant = Restuarant.find_by(id: params[:restuarant_id])
  review = Review.create(
    review: params[:review].capitalize(), rating: params[:rating],  
    company_name: restuarant.name, restuarant_id: restuarant.id
    )
    review.to_json(include: :restuarant)      
end 

delete "/reviews/:id" do 
  review = Review.find_by(id: params[:id])
  review.destroy
  review.to_json
  end
  
end 


