require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @science_fiction = Genre.where(name: 'Science Fiction')

    if @science_fiction.count == 0
      @science_fiction = Genre.create!(name: 'Science Fiction')
    end
  end

  test 'creates new book with valid data' do
    post '/books',
         params: {
             title: 'New York 2140',
             rating: 3,
             author: 'Dave Thomas',
             genre_id: @science_fiction.id,
             review: 'Excellent book for any programmer',
             amazon_id: '131245'
         }.to_json,
         headers: {accept: 'application/json', 'Content-Type' => 'application/json'}

    book = json(response.body)

    assert_equal 201, response.status
    assert_equal book_url(book[:id]), response.location
    assert_equal Mime[:json], response.content_type
    assert_equal 'New York 2140', book[:title]
    assert_equal 3, book[:rating].to_i
    assert_equal @science_fiction.id, book[:genre_id].to_i
    assert_equal 'Excellent book for any programmer', book[:review]
    assert_equal '131245', book[:amazon_id]
  end

  test 'does not create book with invalid data' do
    post '/books',
         params: {title: nil, rating: 3}.to_json,
         headers: {accept: 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 422, response.status
  end
end
