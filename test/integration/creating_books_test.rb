require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  test 'creates new book with valid data' do
    post '/books', 
      params: { title: 'New York 2140', rating: 3 }.to_json , 
      headers: { accept: 'application/json', 'Content-Type' => 'application/json'}

    book = json(response.body)

    assert_equal 201, response.status
    assert_equal book_url(book[:id]), response.location
    assert_equal Mime[:json], response.content_type
    assert_equal 'New York 2140', book[:title]
    assert_equal 3, book[:rating].to_i
  end

  test 'does not create book with invalid data' do
    post '/books', 
      params: { title: nil, rating: 3 }.to_json , 
      headers: { accept: 'application/json', 'Content-Type' => 'application/json'}

    book = json(response.body)

    assert_equal 422, response.status
  end
end
