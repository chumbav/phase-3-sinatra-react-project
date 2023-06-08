class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Get all products
  get '/products' do
    products = Product.all
    products.to_json
  end

  # Get a specific product
  get '/products/:id' do
    product = Product.find(params[:id])
    product.to_json
  end

  # Get all categories
  get '/categories' do
    categories = Category.all
    categories.to_json
  end

  # Add a review for a product
  post '/products/:id/reviews' do
    product = Product.find(params[:id])
    review = Review.new(
      product_id: product.id,
      rating: params[:rating],
      comment: params[:comment]
    )
    if review.save
      review.to_json
    else
      { error: 'Failed to add review' }.to_json
    end
  end

  # Delete a review
  delete '/reviews/:id' do
    review = Review.find(params[:id])
    if review.destroy
      { message: 'Review deleted successfully' }.to_json
    else
      { error: 'Failed to delete review' }.to_json
    end
  end

  # Root endpoint
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end
end
