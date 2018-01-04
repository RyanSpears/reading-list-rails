require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest

  setup do
    if Genre.all.count == 0
      @science_fiction = Genre.create!(name: 'Science Fiction')
      @programming = Genre.create!(name: 'Programming')
    end

    @programming.books.create!(title: 'Pragmatic Programmer', rating: 5, genre_id: Genre.where(name: 'Programming'))
    @science_fiction.books.create!(title: 'Ender\'s Game', rating: 4, genre_id: Genre.where(name: 'Science Fiction'))
  end

  test 'listing books' do
    get '/books'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal 2, json(response.body).size
  end

  test 'list top rated books' do
    get '/books?rating=5'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type  
    assert_equal 1, json(response.body).size

    assert_not_nil json(response.body).first[:genre_id]
    assert_not_nil json(response.body).last[:genre_id]
  end
end