puts "🌱 Seeding spices..."

# Seed your database here

num_restuarants = 10 

num_restuarants.times do 
  Restuarant.create(
    name: Faker::Name.name,
    img: Faker::LoremFlickr.image(size: '300x200'),
    star: rand(0..5),
    location: Faker::Address.city,
    average_price: rand(20..50)
  )
 
  review = Review.create(
    name: Faker::Name.name, 
    review: Faker::lorem.sentence
  )

  (1..num_restuarants).to_a.each do |item|
    RestuarantReview.create(
      restuarant_id: item,
      review_id: review.id
    )

  end 
end 




puts "✅ Done seeding!"
