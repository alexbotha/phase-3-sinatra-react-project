class ReviewsController < ApplicationController

  get "/reviews" do 
    @review = Review.all
    review_to_json
  end 

   get "/reviews/:id" do 
    find_review
    review_to_json 
  end 

  post "/reviews" do 
    @review = Review.new(params)
    if @review.save 
     @review_to_json
 else
  review_error_message 
  end
end 

  delete "/reviews/:id" do 
   find_review
    if @review 
    @review.destroy
    @review.to_json
    else 
      {errors: ["Review doesn't exist "]}.to_json  
  end 
end 

  patch "/reviews/:id" do
    find_review
    if @review.update(params)
      review_to_json
    else 
    review_error_message 
  end 
end

private 
  def find_review
    @review = Review.find_by_id(params["id"])
  end 

  def review_to_json 
    @review.to_json(include: [:restuarant])
  end 

  def review_error_message 
    {errors: @review.errors.full_messages}.to_json
  end 
 

end 