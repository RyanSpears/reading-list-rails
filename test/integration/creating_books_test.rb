require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  test 'creates new book' do
    post '/books', 
      params: { title: 'New York 2140', rating: 3 }.to_json , 
      headers: { accept: 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    book = json(response.body)
    assert_equal book_url(book[:id]), response.location
    assert_equal Mime[:json], response.content_type
  end
end
